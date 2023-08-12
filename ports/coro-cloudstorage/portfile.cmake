vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO lemourin/coro-cloudstorage
  REF a10bde497f983f64c4502382e642e1963cf1f057
  SHA512 8f65414d40cdfc932477392183a5c2b59179c60fbfd76b440415128d4a392cb16bd67dbe969e1d40a1b2945be775c980d485a1331e0665cbddac831ebfdaeed7
  HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS
    -DBUILD_EXAMPLES=OFF
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH share/cmake/coro-cloudstorage)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
