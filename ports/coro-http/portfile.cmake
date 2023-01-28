vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO lemourin/coro-http
	REF 551bde93fc1458ac7fe5e082fe8fb2e921c3a3b8
  SHA512 17c91ba34fd5af973cd8969df95b178e0745d8aa13cc3c9a2ae54a66cf5163c0049f0cd862a240b319ec7dcdefca3244f370dad387ac241f53d0a3332708723b
	HEAD_REF master
)

vcpkg_configure_cmake(
	SOURCE_PATH "${SOURCE_PATH}"
	PREFER_NINJA
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/coro-http)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
