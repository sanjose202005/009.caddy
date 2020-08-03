
xcaddy=$(GoPath21)/xcaddy
go_build_env = CGO_ENABLED=0 $(GoPreLinux386)

CFGmakeRun:=Makefile.run.go01.mk

GoTOP:=\
	test01
    

# https://github.com/caddyserver/caddy
#
c01:=clone_or_pull_caddy_by_git__not_meet_naive
c01 $(c01):
	[ -d caddy_git_newest/ ] || git clone "https://github.com/caddyserver/caddy.git"
	[ -d caddy_git_newest/ ] || mv caddy caddy_git_newest 
	[ -d caddy_git_newest/ ]
	rm -f caddy_git_newest/cmd/caddy/caddy*
	grep -q github.com/caddyserver/forwardproxy \
		caddy_git_newest/cmd/caddy/main.go || \
		sed -i -e '/standard/a     _ "github.com\/caddyserver\/forwardproxy"' \
		caddy_git_newest/cmd/caddy/main.go 
	cd caddy_git_newest/cmd/caddy/ && GO111MODULE=on go build
	llvm-strip -o caddy_git_newest/cmd/caddy/caddy.git.newest.strip.bin caddy_git_newest/cmd/caddy/caddy
	ls -l caddy_git_newest/cmd/caddy/caddy*
	md5sum caddy_git_newest/cmd/caddy/caddy*
	caddy_git_newest/cmd/caddy/caddy.git.newest.strip.bin version

# https://github.com/klzgrad/naiveproxy#why-not-use-http2-proxy-from-browser-directly
c02:=clone_or_pull_caddy_by_git_klzgrad_forwardproxy_naive
c02 $(c02):
	[ -d klzgrad_caddy_naive/ ] || git clone           -b naive https://github.com/klzgrad/forwardproxy  klzgrad_caddy_naive/ 
	[ -d klzgrad_caddy_naive/ ]
	cd klzgrad_caddy_naive/ && \
		$(xcaddy) build --with github.com/caddyserver/forwardproxy=$(PWD)/klzgrad_caddy_naive
	rm -f      klzgrad_caddy_naive/caddy.klzgrad_caddy_naive
	cp         klzgrad_caddy_naive/caddy      \
		       klzgrad_caddy_naive/caddy.klzgrad_caddy_naive
	mkdir -p bin/
	cp         klzgrad_caddy_naive/caddy.klzgrad_caddy_naive bin/
	test -f bin/caddy.klzgrad_caddy_naive.sh || \
		echo -e "#/bin/bash\n\nnice -n 19 ./caddy.klzgrad_caddy_naive  run -config  default.json.127.0.0.1.32018 \n" \
		>   bin/caddy.klzgrad_caddy_naive.sh
	chmod 755 bin/caddy.klzgrad_caddy_naive.sh
	md5sum              klzgrad_caddy_naive/caddy*
	ls  -l              klzgrad_caddy_naive/caddy*
	@echo
	@echo sudo setcap cap_net_bind_service=+ep klzgrad_caddy_naive/caddy*
	@echo

c03:=clone_or_pull_caddy_by_git_klzgrad_forwardproxy_caddy2__not_mit_naive
c03 $(c03):
	[ -d klzgrad_caddy_caddy2/ ] || git clone           -b caddy2 https://github.com/klzgrad/forwardproxy  klzgrad_caddy_caddy2/ 
	[ -d klzgrad_caddy_caddy2/ ]
	cd klzgrad_caddy_caddy2/ && \
		$(xcaddy) build --with github.com/caddyserver/forwardproxy=$(PWD)/klzgrad_caddy_caddy2
	rm -f      klzgrad_caddy_caddy2/caddy.klzgrad_caddy_caddy2
	cp         klzgrad_caddy_caddy2/caddy      \
		       klzgrad_caddy_caddy2/caddy.klzgrad_caddy_caddy2
	mkdir -p bin/
	cp         klzgrad_caddy_caddy2/caddy.klzgrad_caddy_caddy2 bin/
	echo -e "#/bin/bash\n\nnice -n 19 ./caddy.klzgrad_caddy_caddy2  run -config  default.json.127.0.0.1.42018 \n" \
		> bin/caddy.klzgrad_caddy_caddy2.sh
	chmod 755 bin/caddy.klzgrad_caddy_caddy2.sh
	md5sum              klzgrad_caddy_caddy2/caddy*
	ls  -l              klzgrad_caddy_caddy2/caddy*
	@echo
	@echo sudo setcap cap_net_bind_service=+ep klzgrad_caddy_caddy2/caddy*
	@echo
c04:=clone_or_pull_caddy_by_git_forwardproxy_03a7df4__not_meet_naive_new_version
c04 $(c04):
	[ -d 03a7df4_forwardproxy/ ] || git clone           -b caddy2 https://github.com/caddyserver/forwardproxy  03a7df4_forwardproxy/ 
	[ -d 03a7df4_forwardproxy/ ]
	cd 03a7df4_forwardproxy/ && \
		git reset --hard 03a7df4
	cd 03a7df4_forwardproxy/ && \
		$(xcaddy) build --with github.com/caddyserver/forwardproxy=$(PWD)/03a7df4_forwardproxy
	rm -f      03a7df4_forwardproxy/caddy.03a7df4_forwardproxy
	cp         03a7df4_forwardproxy/caddy      \
		       03a7df4_forwardproxy/caddy.03a7df4_forwardproxy
	mkdir -p bin/
	cp         03a7df4_forwardproxy/caddy.03a7df4_forwardproxy bin/
	test -f bin/caddy.03a7df4_forwardproxy.sh || \
		echo -e "#/bin/bash\n\nnice -n 19 ./caddy.03a7df4_forwardproxy  run -config  default.json.127.0.0.1.42018 \n" \
		>   bin/caddy.03a7df4_forwardproxy.sh
	chmod 755 bin/caddy.03a7df4_forwardproxy.sh
	md5sum              03a7df4_forwardproxy/caddy*
	ls  -l              03a7df4_forwardproxy/caddy*
	@echo
	@echo sudo setcap cap_net_bind_service=+ep 03a7df4_forwardproxy/caddy*
	@echo

n05:=clone_and_build_naiverproxy
n05 $(n05):
	[ -d naiveProxy/ ] || git clone           --depth 1 https://github.com/klzgrad/naiveproxy.git    naiveProxy/ 
	[ -d naiveProxy/ ]
	rm -f      naiveProxy/src/out/Release/naive*
	cd naiveProxy/src && ./get-clang.sh
	cd naiveProxy/src && ./build.sh
	llvm-strip -o \
		naiveProxy/src/out/Release/naive.build.strip.bin \
		naiveProxy/src/out/Release/naive      
	mkdir -p bin/
	cp         naiveProxy/src/out/Release/naive.build.strip.bin bin/
	test -f   bin/naive.run.server.sh || \
		echo -e "#/bin/bash\n\nnice -n 19 ./naive.build.strip.bin  naive.config.json.200.server.127.0.0.1.41080.json \n" \
		>     bin/naive.run.server.sh
	chmod 755 bin/naive.run.server.sh
	md5sum              naiveProxy/src/out/Release/naive*
	ls  -l              naiveProxy/src/out/Release/naive*
	@echo
	@echo sudo setcap cap_net_bind_service=+ep naiveProxy/src/out/Release/naive*
	@echo
#https://github.com/klzgrad/naiveproxy/releases/download/v83.0.4103.61-1/naiveproxy-v83.0.4103.61-1-linux-x64.tar.xz




bbX1:=forwardproxy_v1.0.5/cmd/caddy/caddy
#bbX1:=forwardproxyTesting/cmd/caddy/caddy
bc:=build_caddy_newest_v1
bc $(bc):
	[ -d forwardproxy_v1.0.5 ] || git clone        https://github.com/caddyserver/forwardproxy.git
	[ -d forwardproxy_v1.0.5 ] || mv forwardproxy forwardproxy_v1.0.5
	cd forwardproxy_v1.0.5/cmd/caddy/ \
		&& $(go_build_env) go build 
	llvm-strip -o $(bbX1).forwardproxy_v1.0.5.strip.bin $(bbX1) 
	mkdir -p bin/
	cp                                $(bbX1).forwardproxy_v1.0.5.strip.bin    bin/
	echo -e "#/bin/bash\n\nnice -n 19 ./caddy.forwardproxy_v1.0.5.strip.bin    run -config  ../test2/default.json\n" \
		>                           bin/caddy.forwardproxy_v1.0.5.strip.bin.sh  
	chmod 755                       bin/caddy.forwardproxy_v1.0.5.strip.bin.sh  
	ls -l  $(bbX1)*
	#md5sum $(bbX1).strip.bin
	md5sum $(bbX1)*

g1NAME:=ip.jjj123.com
g1:=get_cert_for_$(g1NAME)
g1 $(g1):
	# https://tlanyan.me/use-lets-encrypt-certificate/
	# apt install python3-certbot
	@echo ; echo ' use root to run '
	@echo apt install python3-certbot
	@echo certbot  certonly  --standalone -d $(g1NAME)
	@echo

define config_para1
:80 {
 gzip
 proxy / http://ip.jjj123.com
}

endef
export config_para1

define config_para2
#./caddy.http.forwardproxy -http-port 38210 -conf ./Caddy.2.conf
ip.jjj123.com {
 gzip
 tls ip@jjj123.com
 proxy / https://ipecho.net
}

endef
export config_para2

define configXXX
config$(1):
	@echo
	[ -d conf/ ] || mkdir conf/
	echo "$$$${config_para$(1)}" > conf/Caddyfile.$(1).conf
	@echo

endef

$(foreach aa1, 1 2,$(eval $(call configXXX,$(aa1))))

conf: $(foreach aa1, 1 2,config$(aa1))
# /etc/letsencrypt/csr/0000_csr-certbot.pem /etc/letsencrypt/keys/0000_key-certbot.pem
# ~/.caddy/acme/acme-v02.api.letsencrypt.org/sites/ip.jjj123.com/
# ./caddy.http.forwardproxy -http-port 38210 -conf ./Caddy.2.conf ## how to turn 80 to 38210
# https://doubibackup.com/l-en8vwt-2.html

define xxx

	[ -f $(xcaddy) ] || \
		go get -u github.com/caddyserver/xcaddy/cmd/xcaddy
	rm -fr $(1)/caddy.*
	mkdir -p $(1)/
	cd $(1) \
		&& $(xcaddy) build \
		--with github.com/caddyserver/$(2)
	ls -l                                    `realpath $(1)/caddy`
	md5sum                                   `realpath $(1)/caddy`
	@echo
	@echo use root to run :
	@echo setcap 'cap_net_bind_service=+ep'  `realpath $(1)/caddy`
	@echo see : https://xiaoxx.cc/caddy-ws-v2ray/
	@echo see : https://tlanyan.me/v2ray-traffic-mask/
	@echo

endef


# https://github.com/caddyserver/xcaddy
x1:=build_caddy_with_plugin_1_ntlm-transport
x1 $(x1):
	$(call xxx,x1,ntlm-transport)

x2:=build_caddy_with_plugin_2_forwardproxy
x2 $(x2):
	$(call xxx,x2,forwardproxy)

lm:=list_modules
lm $(lm):
	cd x1 && $(xcaddy)  \
	list-modules

c1ver:=2.1.0
c1uri1:=https://github.com/caddyserver/caddy/releases/download/v$(c1ver)/
c1uri2:=caddy_$(c1ver)_linux_amd64.tar.gz
c1uri3:=c1/caddy_$(c1ver)_linux_amd64.tar.gz
c1uri4:=c1/caddy
c1uri9:=$(c1uri1)/$(c1uri2)
c1:=download_caddy_$(c1ver)
c1 $(c1):
	[ -d c1/ ] || mkdir c1/
	[ -f $(c1uri3) ] || wget -O $(c1uri3)  $(c1uri9)
	[ -f $(c1uri4) ] || (cd c1/ && tar xfz $(c1uri2))
	@echo ; echo "`realpath $(c1uri4)`     "
	@echo

s1:=show1
define show1

$(PWD)/x2/caddy  adapt --config  $(PWD)/conf/Caddyfile.1.conf

endef

define tttt2x

	@echo
	curl http://127.0.0.1:2019/load \
		-X POST \
		-H "Content-Type: application/json" \
		$(1)
	@echo

endef

s1:

tr:=run_caddy_forward_within_nohup
tr $(tr) :
	@echo
	rm -f nohup.out
	nohup nice -n 19 x2/caddy run &
	@sleep 1
	@echo
	tail nohup.out
	@echo

t21:=reload_caddy_forward_from_json21
$(t21):=json/json21.conf
t21 $(t21):
	$(call tttt2x, -d @$($(t21)))

t22:=reload_caddy_forward_from_Caddyfile22
$(t22):=conf/Caddyfile.2.conf
t22 $(t22):
	$(call tttt2x, --data-binary  @$($(t22)))

t23:=try_modify_body_only
t23 $(t23):
	curl \
		localhost:2019/config/apps/http/servers/example/routes/0/handle/0/body \
		-X POST \
		-H "Content-Type: application/json" \
		-d '"Work smarter, not harder."'

t24:=try_use_id_only
t24 $(t24):
	curl \
		localhost:2019/config/apps/http/servers/example/routes/0/handle/0/@id \
		-X POST \
		-H "Content-Type: application/json" \
		-d '"msg"'

t25:=try_get_id_of_body
t25 $(t25):
	curl localhost:2019/id/msg/body

tg:=get_current_config_of_caddy
tg $(tg):
	@echo
	#curl http://127.0.0.1:2019/config/ |json_pp -json_opt pretty,canonical
	curl http://127.0.0.1:2019/config/ | jq
	@echo
	
tstop $(tstop):
	@echo
	curl "http://127.0.0.1:2019/stop" \
		-X POST \
	@echo
	

define update_file_def

../009.caddy.x/$(strip $(1))/caddy : $(strip $(1))/caddy 
	touch     $$@
	chmod 777 $$@
	cat $$^ > $$@

xxJson_$(strip $(1)) :
	[ ! -d ../009.caddy.x/$(strip $(1))/src ] || ( \
		cd ../009.caddy.x/$(strip $(1))/ && \
		rm -f test.*.json && \
		ln -s ../../009.caddy/$(strip $(1))/test.*.json ./ )


endef

$(foreach aa2, x1 x2 , $(eval $(call update_file_def, $(aa2))))

xx:=update_files_to__009.caddy.x
$(xx): xx
xx: $(foreach aa1, x1 x2, ../009.caddy.x/$(aa1)/caddy xxJson_$(aa1) )

X:=commit_all
$(X):=ga gcX up
X $(X): $($(X))

ctls:=check_tls
$(ctls):=openssl s_client -host ip.jjj123.com -port 443 < /dev/null


#showRunHelpListLast += c01 x1 x2 lm c1 s1 conf
#showRunHelpListLast += tr tg t21 t22 t23 t24 t25 
#showRunHelpListLast += c03 c04 
showRunHelpListLast += bc xx c02 n05 X ctls

.PHONY : x1 x2 c1 conf
