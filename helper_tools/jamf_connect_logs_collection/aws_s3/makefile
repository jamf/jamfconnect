PKGTITLE="aws_jclogs"
PKGVERSION=1.0
PKGID="com.jamf.aws.jclogs"
PROJECT="aws_jclogs"
DeveloperID=""
# Dedicated, least-privilege AWS profile to package (only this profile is included, never the whole ~/.aws)
AWS_PROFILE_NAME=

clean:
	rm -f ./${PKGTITLE}-*.pkg
	rm -rf pkgroot
	rm -rf ./signed

pkg: clean
	mkdir -p pkgroot/opt
	mkdir ./signed
	@test -n "${AWS_PROFILE_NAME}" || { echo "Set AWS_PROFILE_NAME to the dedicated upload profile"; exit 1; }
	mkdir -p pkgroot/opt/.aws
	awk -v p="[${AWS_PROFILE_NAME}]" '/^\[/ {on=($$0==p)} on' ~/.aws/credentials > pkgroot/opt/.aws/credentials
	awk -v p="[profile ${AWS_PROFILE_NAME}]" -v d="[${AWS_PROFILE_NAME}]" '/^\[/ {on=($$0==p || $$0==d)} on' ~/.aws/config > pkgroot/opt/.aws/config
	@test -s pkgroot/opt/.aws/credentials || { echo "Profile ${AWS_PROFILE_NAME} not found in ~/.aws/credentials"; exit 1; }
	chmod 700 pkgroot/opt/.aws
	chmod 400 pkgroot/opt/.aws/*
	pkgbuild --root pkgroot --identifier ${PKGID} --version ${PKGVERSION} ./${PKGTITLE}-${PKGVERSION}.pkg
#	productsign --sign ${DeveloperID} ${PKGTITLE}-${PKGVERSION}.pkg signed/${PKGTITLE}-${PKGVERSION}.pkg