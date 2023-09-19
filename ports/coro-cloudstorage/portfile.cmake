vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO lemourin/coro-cloudstorage
  REF 28b03b9e48ba5d999dabda0661d63368ab6ee520
  SHA512 334d5dfc29eb5913438ad5ead6ef3d91369b9975a7da223c54afbab17f1f5bc7030fc2d0220b1d04f2cb4df26bba48935f42970b4546dad66dafa944a7fa5bb0
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
