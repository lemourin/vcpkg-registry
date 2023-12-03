vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO lemourin/coro-http
  REF 4bfcbc7fcf37b2704ec5efab737d14f679621a2c
  SHA512 3e18f3177aba991510a4b8447104c54ba34632399c4b480f07fbd0de6bfaa885c10692362ae0d3cc5925c33ba0efcb3bc6f0f4fe35cb85248528fcbb8b480a71
  HEAD_REF master
)

set(OPTIONS "-DBUILD_EXAMPLES=OFF")
if("stacktrace" IN_LIST FEATURES)
  list(APPEND OPTIONS "-DWITH_STACKTRACE=ON")
endif()

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS ${OPTIONS}
)
vcpkg_cmake_install(DISABLE_PARALLEL)
vcpkg_cmake_config_fixup(CONFIG_PATH share/cmake/coro-http)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
