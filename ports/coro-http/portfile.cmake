vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO lemourin/coro-http
  REF 862a4d27223b305c01f2abeb7c737f8baa136fa6
  SHA512 579144941f98db65e61768d5985885761070e206ecd3a721aa1bcd7751e4deb4d13bf16ea5332ed92e12803ac9653e95fa857cbe2a6a88e18acb2e99316ba617
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
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH share/cmake/coro-http)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
