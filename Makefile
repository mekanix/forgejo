REGGAE_PATH = /usr/local/share/reggae
FQDN ?= example.com
USE = letsencrypt postgresql forgejo nginx

.include <${REGGAE_PATH}/mk/use.mk>

post_setup:
.for service url in ${ALL_SERVICES}
	@echo "FQDN = ${FQDN}" >>services/${service}/project.mk
.endfor
	@echo "\$${base}/letsencrypt/usr/local/etc/dehydrated/certs \$${path}/etc/certs nullfs ro 0 0" >services/nginx/templates/fstab

.include <${REGGAE_PATH}/mk/project.mk>
