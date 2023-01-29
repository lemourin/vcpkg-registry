vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO lemourin/coro-cloudstorage
  REF 044177b8e1e383d0c07a0ed19c44cd950e568dac
  SHA512 e722f2c73eabf4fc0a2f0b8e4fbf9179fcdcfd0ad412383affea315a5e805b3e766e8af3d88e9421e344117795ab030cabe7f0fb2d4f89b27f17eddf441a3ee6
  HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH share/cmake/coro-cloudstorage)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
