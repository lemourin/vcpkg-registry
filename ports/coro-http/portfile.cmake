vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO lemourin/coro-http
  REF 6b99937a0f3d944995cd21739d03082e38db9b22
  SHA512 7dc0064754aafb7f2959af80dedd297e34a097e349a759ab15a887ce7f19a5b13767d21dbe82660c5727082a4cdbfdcd92ebdaa988b2ac31e87c66eb6c36003d
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
