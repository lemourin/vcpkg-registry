vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO antlr/antlr4
    HEAD_REF dev
    REF "${VERSION}"
    SHA512 947ecca28712aa4dd98d7b7e0753e91881e55642f7951ca65a576b94db87440767a1b93d08e82db69ad527ee28bf89f0b2f9c0aaa604a999a7e48c163764ee12
    PATCHES
        set-export-macro-define-as-private.patch
)

set(RUNTIME_PATH "${SOURCE_PATH}/runtime/Cpp")

message(INFO "Configure at '${RUNTIME_PATH}'")

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "static" BUILD_STATIC)
string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" BUILD_SHARED)

vcpkg_cmake_configure(
    SOURCE_PATH "${RUNTIME_PATH}"
    OPTIONS
        -DANTLR_BUILD_STATIC=${BUILD_STATIC}
        -DANTLR_BUILD_SHARED=${BUILD_SHARED}
        -DANTLR4_INSTALL=ON
        -DANTLR_BUILD_CPP_TESTS=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME antlr4-generator CONFIG_PATH lib/cmake/antlr4-generator DO_NOT_DELETE_PARENT_CONFIG_PATH)
vcpkg_cmake_config_fixup(PACKAGE_NAME antlr4-runtime CONFIG_PATH lib/cmake/antlr4-runtime)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_copy_pdbs()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

vcpkg_download_distfile(
    ANTLR4_JAR_LOCATION
    URLS https://www.antlr.org/download/antlr-4.13.0-complete.jar
    FILENAME antlr4.jar
    SHA512 cfa01c4586f21694db94c8540da0e84237ba00ad0fea946e85227210189a35c03cf7989954309fc54e0ae495de3fe5b48e468f703f16be0b1712406049310ae0
)
file(INSTALL "${ANTLR4_JAR_LOCATION}" DESTINATION "${CURRENT_PACKAGES_DIR}/share/antlr4-generator")
file(READ "${CURRENT_PACKAGES_DIR}/share/antlr4-generator/antlr4-generator-config.cmake" ANTLR4_GENERATOR_CONFIG)
file(
    WRITE "${CURRENT_PACKAGES_DIR}/share/antlr4-generator/antlr4-generator-config.cmake" "set(ANTLR4_JAR_LOCATION \"\$\{CMAKE_CURRENT_LIST_DIR\}/antlr4.jar\")\n${ANTLR4_GENERATOR_CONFIG}"
)
