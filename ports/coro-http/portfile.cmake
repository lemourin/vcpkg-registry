vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO lemourin/coro-http
  REF 61fa69feaf4d186d0b1931143c1a8c576fae981d
  SHA512 41d77b0b877acb288a46ff1f5f7f32b7c63f9d4200b56bf6b9eb0cb318cfcf1d78b35109fb323edff2b1d181b6076a507d458506010aae5fee11f6826e4c15da
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
