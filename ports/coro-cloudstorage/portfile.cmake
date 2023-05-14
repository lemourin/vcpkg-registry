vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO lemourin/coro-cloudstorage
  REF 3ebe7bf2df70a217c49b9276416ae833f6cb196c
  SHA512 f897ce96c0e08ca7addf03e547519fbbd4237b920756b9296b0bf92e7146567595dc18576552e1fab004588fb5b9c9a87c69b6f5640cb34d78b3bb593b9ecc98
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
