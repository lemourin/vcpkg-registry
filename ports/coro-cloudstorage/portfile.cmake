vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO lemourin/coro-cloudstorage
  REF 337883ee0cce6f2bad37cb306ec0c3d9f26414a3
  SHA512 1e62c4a7d24c789b99bd17fd30b2df50ec7e0a9f5d41f11503b40e4841a07ffde6da264bcc5957a6b5d978201379732066b98844c42c68242b1c3d4a86fd2d2c
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
