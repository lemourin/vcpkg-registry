vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO lemourin/coro-http
  REF 806be29b4fd7ac0f702ee64004f7c5e8603e9cbd
  SHA512 7db5c16df4b2a792deae7682bb1a46d7ec530d239566950134f1bd9036a5b0d56f036f9b58fabf0da82e40ca398da4123730042584edec6d5a6bfc53e95a9a1f
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
