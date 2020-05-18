FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
	file://0001-Set-default-skin-Satdreamgr-HD-TranspBA.patch \
	file://0002-Satdreamgr-InfoBarGenerics-changes.patch \
	file://0001-Satdreamgr-show-softwaremanger-on-setupmenu.patch \
	file://0001-Satdreamgr-tempfancontrol-add-support-for-dmv2.patch \
	file://0001-Satdreamgr-Devices-with-Spaces.patch \
	file://caid2.patch \
	file://expert.patch \
	file://transba.patch \
	file://vh2.patch \
	file://pos.patch \
	file://sdgjson.patch \
	file://sdg_about.patch \
	file://sdg_extra_translations.patch \
	file://sdg_hdmicec.patch \
	file://sdg_sw.patch \
	"

SRC_URI_append_ixusszero = " file://0001-Ixuss-disable-blending-issues.patch "
SRC_URI_append_ixussone = " file://0001-Ixuss-disable-blending-issues.patch "
SRC_URI_append_sf4008 = " file://sf4008_boxmode6.patch file://sf4008rc2.patch file://sdg_vtuner_msg2.patch "
SRC_URI_append_sf8008 = " file://sf8008_e2.patch;apply=no file://sdg_vtuner_msg2.patch file://sdg_hdmioutput.patch "

RRECOMMENDS_${PN} = " \
	tzdata enigma2-plugin-skins-satdreamgr-hd-transpba \
	glib-networking \
	hotplug-e2-helper \
	glibc-gconv-utf-16 \
	python-sendfile \
	virtual/enigma2-mediaservice \
	"

do_install_append() {
	if [ "${base_libdir}" = "/lib64" ] ; then
		install -d ${D}/usr/lib
		ln -s ${libdir}/enigma2 ${D}/usr/lib/enigma2
		ln -s ${libdir}/python2.7 ${D}/usr/lib/python2.7
	fi
}

FILES_${PN} += "/usr/lib"

do_openpli_branding() {
	if [ -n "${BRANDINGDIR}" -a -d "${BRANDINGDIR}/enigma2" ] ; then
		cp -r --preserve=mode,links ${BRANDINGDIR}/enigma2/* ${S}/data/
	fi
}

addtask openpli_branding after do_unpack before do_configure

