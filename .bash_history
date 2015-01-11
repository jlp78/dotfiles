less nimbus.py 
#1411778473
cssh `eh -e %prod-ltx1.tag_hosts:graphdb-staging`
#1412729633
vi cheat-sheet 
#1412730864
ssh ltx1-app10112.prod.linkedin.com
#1412730936
eh -e %prod-ltx1.tag_hosts:experimental-cluster1,%prod-ltx1.tag_hosts:experimental-cluster2
#1412730939
eh -e %prod-ltx1.tag_hosts:experimental-cluster1,%prod-ltx1.tag_hosts:experimental-cluster2 | wc -l
#1412788602
cd work/cloud-nimbus-configs
#1412788613
cd config/app/cloud-nimbus-war/prod-ltx1/
#1412788617
vi experimental-cluster2.src 
#1412788646
vi experimental-cluster1.src 
#1412788668
svin commit -m "typo in attribute value, missing quote"
#1412788699
cfg2 up
#1412788814
ssh ltx1-admin01.prod.linkedin.com
#1412792872
cssh `eh -e %prod-ltx1.tag_hosts:experimental-cluster1,%prod-ltx1.tag_hosts:experimental-cluster2`
#1412797850
cd
#1412797854
cd .deployment/modtopo/
#1412797862
cd fabrics/prod-ltx1/
#1412797868
grep cloud-limited-release *
#1412797877
grep cloud-limited-release hosts.xml
#1412797889
less hosts.xml
#1412797925
grep 'tag app-id=\"cloud-limited-release' hosts.xml
#1412799377
ssh ltx1-app10019.prod.linkedin.com
#1412877239
ls
#1412877250
grep 'tag app-id=\"cloud-nimbus' hosts.xml | awk '{print $3}' | sort -u
#1412877343
grep 'tag app-id=\"cloud-session' hosts.xml | awk '{print $3}' | sort -u
#1412877354
grep 'tag app-id=\"cloud-ncs' hosts.xml | awk '{print $3}' | sort -u
#1412877557
grep 'tag app-id=\"cloud-limited-release' hosts.xml | awk '{print $3}' | sort -u
#1412884417
ssh ltx1-app11199.prod.linkedin.com
#1411769693
cd .irssi/scripts/
#1411769693
less trackbar.pl 
#1411769693
inphone ldibble
#1411769693
inphone japeters
#1411769693
oncall graph-and-analytics
#1411769693
oncall query graph-and-analytics
#1411769693
less config
#1411769693
oncall query graph-and-analytics
#1411769693
ssh ltx1-admin01
#1411769698
cd Downloads/
#1411769699
less diff 
#1411769711
grep ^Index: diff | less
#1411769745
owner
#1411769747
ownership
#1411769751
man ownership
#1411769780
owner-for-module course-match
#1411769788
owner-for-module -m course-match
#1411769804
owner-for-war course-match
#1411769808
owner-for-war -c course-match
#1411769815
owner-for-war -w course-match-war
#1411769820
owner-for-war -w course-match
#1412010577
cd
#1412010736
ssh ltx1-admin01.prod.linkedin.com
#1412034917
grep salt cheat*
#1412036596
eh -e %prod-lva1.tag_hosts.cloud-session.1 --show-tags
#1412036602
eh -e %prod-lva1.tag_hosts.cloud-session.1 --list-tags
#1412036614
app-cloud-session.1 --help | grep tags
#1412097785
porter list | grep 15180
#1412633271
cd work/cluster_inconsistency/
#1412633280
./fix_cluster_inconsistency.py --help
#1412633312
./fix_cluster_inconsistency.py -f prod-lva1 -c 3 -p 116 160 173 190 223 227 231 237 241 259 272 289 29 308 324 360 382 437 449 463 464 476 489 84 97
#1412633416
./fix_cluster_inconsistency.py -f prod-lva1 -c 6 -p 0 106 108 12 136 14 141 158 17 177 182 199 22 238 239 251 261 263 271 273 280 289 293 295 296 30 304 316 317 346 35 375 380 405 408 409 430 437 448 456 458 462 476 477 491 499 53 6 76 96
#1412633579
cd cloud-nimbus-utils
#1412633581
svn up
#1412633589
svn st
#1412633592
cd trunk
#1412633595
cd bin
#1412633595
lf
#1412633601
less coldCacheCopy 
#1412634425
cd ..
#1412635044
cd /usr/local/linkedin/lib/python2.6/site-packages/linkedin/ops
#1412635048
cd nimbus/
#1412635049
ls
#1412635058
less nimbus.py 
#1412635277
eh -e %prod-lva1.host_tags:lva1-app2046.prod.linkedin.com
#1412635358
mssh -r  %prod-lva1.tag_hosts:graphdb-seed "cd /export/content/lid/apps/cloud-nimbus/i001/bin; sudo -u app ./container-jettyctl.sh -r stop"
#1412635467
mssh -m 10 -t 600 -T 3600 -r  %prod-lva1.tag_hosts:graphdb-seed "cd /export/content/lid/apps/cloud-nimbus/i001/bin; sudo -u app ./container-jettyctl.sh -r stop"
#1412636049
eh -e %prod-lva1.host-tags:lva1-app5725.prod.linkedin.com
#1412636055
eh -e %prod-lva1.host_tags:lva1-app5725.prod.linkedin.com
#1412636098
eh -e %prod-lva1.tag_hosts:graphdb-cluster6
#1412637858
eh -e %prod-lva1.tag_hosts:graphdb-seed
#1412633728
ssh lva1-app5725.prod.linkedin.com
#1412636180
ssh lva1-app5055.prod.linkedin.com
#1412633904
vi .bashrc
#1412633904
remember
#1412633917
cd work/clusterbuilder/
#1412633941
svn up
#1412634050
svn log | less
#1412634072
svn diff -r375655
#1412634117
svn diff -r366922:375655
#1412634138
svn diff --diff-cmd=meld -r366922:375655
#1412635115
cd ..
#1412635115
ls
#1412635118
ls nimbus-tools/
#1412635121
cd nimbus-tools/
#1412635124
svin up
#1412635179
svin log | less
#1412635435
grep mssh ~/cheat*
#1412635445
mssh --help
#1412635530
vi /home/japeters/cheat-sheet 
#1412638221
ssh lva1-app5055.prod.linkedin.com
#1412010869
eh -e %ela4.liar-lame.1
#1412010869
ssh ela4-app4640.prod.linkedin.com
#1412010869
control-deployment --fabric ela4 restart liar-lame --host-concurrency 2
#1412010869
control-deployment --fabric prod-lva1 restart liar-lame --host-concurrency 2
#1412010869
control-deployment --fabric ela4 restart liar-lame --host-concurrency 4
#1412010869
cd irclogs/LinkedIn/
#1412010869
less \#gcn-17515.log 
#1412010869
cd .irssi/scripts/
#1412010869
less trackbar.pl 
#1412010869
inphone ldibble
#1412010869
inphone japeters
#1412010869
oncall graph-and-analytics
#1412010869
oncall query graph-and-analytics
#1412010869
less config
#1412010869
oncall query graph-and-analytics
#1412010869
ssh ltx1-admin01
#1412010869
ssh ltx1-admin01.prod.linkedin.com
#1412010869
ssh ltx1-admin01.prod.linkedin.com
#1412010880
ssh ltx1-app6511.prod.linkedin.com
#1412034631
eh -e '%prod-ltx1.tag_hosts:cloud-nimbus-utils.experimental'
#1412034641
ssh ltx1-app9984.prod.linkedin.com
#1412034895
ssh lva1-app2492.prod.linkedin.com
#1412097346
ssh ela4-admin01.prod.linkedin.com
#1412186427
remember sj
#1412186434
remember
#1412186460
memorize
#1412192815
remember clipper
#1412192854
vi Dropbox/memory.txt
#1412196845
dc
#1412204128
remember 2061
#1412204132
remember address
#1412630620
ssh -p 2222 root@peterson.ath.cx
#1413231957
scrabler3 pentmnn
#1413231963
scrabler3 pentmnng g
#1413231968
scrabler3 pentmnna a
#1413231976
scrabler3 pentmnnt t
#1413231986
scrabler3 pentmnne e
#1413231994
scrabler3 pentmnnd d
#1413420068
cd oo
#1413420070
cd
#1413420076
cd dar
#1413420109
cd kk
#1413420113
cd pm
#1413420116
cd Util
#1413420166
less Rsync.pm 
#1413420181
less FileSync.pm 
#1413420242
less SysConfig.pm 
#1413420248
ls
#1413420264
cd Admin
#1413420272
cd ..
#1413420273
l
#1413420275
lf
#1413420280
grep rsync *
#1413420290
man rsync
#1413420491
grep -i exclude *
#1413420501
less pushplatform 
#1413420878
grep -i exclude * 
#1413420891
less chksum.pl 
#1413420931
grep -il exclude * 
#1412031662
inphone ldibble
#1412031662
eh -e %prod-lva1.tag_hosts:liar-lame
#1412031662
eh -e %prod-lva1.tag_hosts:liar
#1412031662
eh -e %prod-lva1.list-tags
#1412031662
cd fabrics/
#1412031662
cd prod-lva1/
#1412031662
grep liar-lame *
#1412031662
control-deployment restart --help
#1412031662
eh -e %ela4.tag_hosts:liar-lame
#1412031662
eh -e %ela4.liar-lame
#1412031662
eh -e %ela4.liar-lame.1
#1412031662
ssh ela4-app4640.prod.linkedin.com
#1412031662
control-deployment --fabric ela4 restart liar-lame --host-concurrency 2
#1412031662
control-deployment --fabric prod-lva1 restart liar-lame --host-concurrency 2
#1412031662
control-deployment --fabric ela4 restart liar-lame --host-concurrency 4
#1412031662
cd irclogs/LinkedIn/
#1412031662
less \#gcn-17515.log 
#1412031662
cd .irssi/scripts/
#1412031662
less trackbar.pl 
#1412031662
inphone ldibble
#1412031662
inphone japeters
#1412031662
oncall graph-and-analytics
#1412031662
oncall query graph-and-analytics
#1412031662
cd ..
#1412031662
less config
#1412031662
oncall query graph-and-analytics
#1412031662
ssh ltx1-admin01
#1412031662
ssh ltx1-admin01.prod.linkedin.com
#1412031662
ssh ltx1-admin01.prod.linkedin.com
#1412031685
eh -e %prod-lva1.tag_hosts:cloud-nimbus-utils.experimental
#1412032144
eh -e "%%ela4.cloud-nimbus & %%ela4.seas-ids - %%ela4.graph-cache-distributor"
#1412032247
w
#1412034552
ssh lva1-app9526.prod.linkedin.com
#1412108502
modtopo checkout --force
#1412108592
find . -type f -print -o -name .svn -prune | xargs grep 15549 /dev/null
#1412108598
find . -type f -print -o -name .svn -prune | xargs grep -l 15549 /dev/null
#1412108607
vi global/topology.xml
#1412108823
porter list | grep 15549
#1412108988
cd work/graph-cache-distributor-configs/config/container/graph-cache-distributor/
#1412108997
vi container.src 
#1412118254
cd /etc/pam.d
#1412118289
ls sshd
#1412118351
man su
#1412118674
ls /etc/hosts.deny
#1412118677
cat /etc/hosts.deny
#1412118811
locate pam_localuser.so
#1412118818
ls /lib64/security/
#1412118892
man -k pam
#1412119070
man -k pam_
#1412119080
man pam_hulk
#1412119088
man pam_unix
#1412119119
man pam_cracklib
#1412119845
man -k fips
#1412119867
man ssh
#1412119886
man ssh_config
#1412119925
ls ~/.ssh
#1412119942
which sshd
#1412119946
strings /usr/sbin/sshd
#1412119952
strings /usr/sbin/sshd | grep /
#1412120902
less /etc/ssh/sshd_config
#1412120904
sudo less /etc/ssh/sshd_config
#1412120936
less /etc/ssh/ssh_config
#1412122606
man sshd
#1412122814
/usr/sbin/sshd -p 2222 -ddde
#1412122826
sudo /usr/sbin/sshd -p 2222 -ddde
#1412123072
man sshd_config
#1412123102
sudo /usr/sbin/sshd -p 2222 -ddde -o UsePAM=no
#1412123235
cat system-auth
#1412123271
ls /lib64/security
#1412123404
less login
#1412123565
man pam_limits
#1412123590
cat locate limits.conf
#1412123594
locate limits.conf
#1412123599
cat /etc/security/limits.conf
#1412123618
less sshd
#1412123643
cat password-auth
#1412124471
cat sshd
#1412124476
grep hulk *
#1412614890
mkpw --help
#1412614906
vi bin/scripts/mkpw
#1412614977
emacs&
#1412615214
mkpw --num-pws=20
#1412625394
cd 
#1412625397
cd .deployment/modtopo/
#1412625403
cd fabrics/prod-ltx1/
#1412625410
less hosts.xml
#1412631156
mosh jlp@jay1.jay-one.org
#1412731527
cd
#1412731582
cssh `eh -e %prod-ltx1.tag_hosts:graphdb-staging`
#1412899846
eh -e %prod-ltx1.tag_hosts:cloud-nimbus-utils.experimental
#1412899856
eh -e %prod-ltx1.tag_hosts:cloud-nimbus-utils.experimental > /tmp/j1
#1412899922
eh -e %{prod-ltx1.tag_hosts:cloud-nimbus-utils.experimental & prod-ltx1.tag_hosts:cloud-limited-release & prod-ltx1.tag_hosts:cloud-session}
#1412899938
eh -e '%{prod-ltx1.tag_hosts:cloud-nimbus-utils.experimental & prod-ltx1.tag_hosts:cloud-limited-release & prod-ltx1.tag_hosts:cloud-session}'
#1412899961
eh -e '{%prod-ltx1.tag_hosts:cloud-nimbus-utils.experimental & %prod-ltx1.tag_hosts:cloud-limited-release & %prod-ltx1.tag_hosts:cloud-session}'
#1412900033
eh -e %ela4.host_tags:ela4-monitor15.prod.linkedin.com
#1412961985
remember zipcar
#1412971306
eh -e %prod-ltx1.tag_hosts:graphdb-cluster1
#1412971313
ssh ltx1-app9754.prod.linkedin.com
#1412972036
pdate
#1412972049
dar/bin/scripts/pdate 1410487559559
#1412972316
invips2 
#1412972325
invips2 search
#1412972442
invips2 search -f prod-ltx1 vip ltx1-kafka-kafta-tracking-vip
#1412972489
invips2 search vip ltx1-kafka-kafta-tracking-vip
#1412972542
invips2 search vip -f ltx1-kafka-kafta-tracking-vip
#1412972549
invips2 search vip -f prod-ltx1 ltx1-kafka-kafta-tracking-vip
#1412972573
invips2 -f prod-ltx1 search vip ltx1-kafka-kafta-tracking-vip
#1412972600
host ltx1-kafka-kafka-tracking-vip.prod.linkedin.com
#1412972929
invips2 -f prod-ltx1 search 
#1412972942
invips2 -f prod-ltx1 search service_group ltx1-kafka-kafta-tracking-vip
#1412972964
invips2 -f prod-ltx1 search vip ltx1-kafka-kafta-tracking-vip.prod.linkedin.com
#1412972987
invips2 -f prod-ltx1 search server ltx1-kafka-kafta-tracking-vip.prod.linkedin.com
#1412973001
invips2 -f prod-ltx1 search healthcheck ltx1-kafka-kafta-tracking-vip.prod.linkedin.com
#1412973013
invips2 -f prod-ltx1  ltx1-kafka-kafta-tracking-vip.prod.linkedin.com
#1412973020
invips2 -f prod-ltx1 lookup ltx1-kafka-kafta-tracking-vip.prod.linkedin.com
#1412973026
invips2 -f prod-ltx1 lookup vip ltx1-kafka-kafta-tracking-vip.prod.linkedin.com
#1412973141
invips2 -f prod-ltx1 lookup vip ltx1-kafka-kafka-tracking-vip.prod.linkedin.com
#1412973150
invips2 -f prod-ltx1 search vip ltx1-kafka-kafka-tracking-vip.prod.linkedin.com
#1412981150
cd work/cloud-nimbus-configs/
#1412981170
find . -type f -print -o -name .svn -prune | xargs grep -i kafka-tracking-vip /dev/null
#1412981276
find . -type f -print -o -name .svn -prune | xargs grep -i broker /dev/null
#1412981287
find . -type f -print -o -name .svn -prune | xargs grep -i broker /dev/null | grep kafka
#1412981309
find . -type f -print -o -name .svn -prune | xargs grep -i kafka.broker /dev/null
#1412981330
cd config/fabric
#1412981524
cd /tmp
#1412981525
ls
#1412981536
less kafka.txt 
#1412981545
cd -
#1412981552
less prod-ltx1.fabric
#1412981591
cat /tmp/kafka.txt 
#1412981595
fg
#1413233809
remember kickstarter
#1413245431
ssh lva1-admin01.prod.linkedin.com
#1412034931
ssh ltx1-admin01.prod.linkedin.com
#1412034950
eh -e %prod-lva1:SALT_MASTER
#1412034958
ssh lva1-salt-master.prod.linkedin.com
#1412097444
ssh ela4-app9754.prod.linkedin.com
#1412633347
eh -e %prod-lva1.tag_hosts:graphdb-cluster3
#1412633477
ssh lva1-app5725.prod.linkedin.com
#1412636110
ssh lva1-app5298.prod.linkedin.com
#1412636171
ssh lva1-app5055.prod.linkedin.com
#1416851050
ps guaxww 
#1416851055
| grep firefox
#1416851092
kill 400 563
#1416851160
ps guaxww | grep firefox
#1416851191
sudo shutdown -r now
#1412973398
scrabler3 mee
#1412973402
scrabler3 mea
#1412973942
scrabler3 nae
#1412974209
scrabler3 jae
#1413239886
install-usr-local-linkedin 
#1413239893
sudo install-usr-local-linkedin 
#1413239906
which install-usr-local-linkedin 
#1413239914
sudo /usr/local/linkedin/bin/install-usr-local-linkedin 
#1416848285
w
#1416848297
sudo yum upgrade
#1416848362
ps guaxww | grep sav
#1416848372
ps guaxww | grep prox
#1412729867
vi
#1412805761
ssh ltx1-admin01.prod.linkedin.com
#1412118831
cd ..
#1412118831
less config
#1412118831
oncall query graph-and-analytics
#1412118831
ssh ltx1-admin01
#1412118831
ssh ltx1-admin01.prod.linkedin.com
#1412118831
cd
#1412118831
ssh ltx1-admin01.prod.linkedin.com
#1412971107
scrabler3 queeemy
#1412971114
scrabler3 queeemyt t
#1412971126
scrabler3 queeemye e
#1412973766
scrabler3 ee
#1412973772
scrabler3 ba
#1412973778
scrabler3 ea
#1412973784
scrabler3 lae
#1412973804
scrabler3 lee
#1413237585
top
#1413237614
ps l13363
#1413237617
ps wl13363
#1413243091
sudo yum search davmail
#1413243192
cd Downloads/
#1413243193
ls dav*
#1413243209
tar tvfz davmail-linux-x86_64-4.5.1-2303.tgz 
#1413243218
ls ../
#1413243225
mkdir ../Source
#1413243228
cd ../Soruce
#1413243231
cd ../Source
#1413243240
tar xvfz ~/Downloads/davmail-linux-x86_64-4.5.1-2303.tgz 
#1413243243
cd davmail-linux-x86_64-4.5.1-2303/
#1413243244
lf
#1413243253
less davmail.sh
#1413243263
which java
#1413243278
ls /export/apps/jdk
#1413243288
sudo update-java-alternatives
#1413243303
ls /usr/bin/*java*
#1413243308
update-alternatives
#1413243316
update-alternatives--display java
#1413243323
update-alternatives --display java
#1413243345
cd /usr
#1413243352
cd lib
#1413243357
namei /usr/bin/java
#1413243364
cd /etc/alternatives
#1413243365
ls
#1413243382
sudo ln -s /export/apps/jdk/JDK-1_8_0_5/bin/java java
#1413243386
sudo ln -sf /export/apps/jdk/JDK-1_8_0_5/bin/java java
#1413243388
ls -l java
#1413243392
ls java*
#1413243407
sudo update-alternatives
#1413243433
sudo update-alternatives display java
#1413243465
sudo update-alternatives 
#1413243470
sudo update-alternatives --set java
#1413243474
sudo update-alternatives --auto java
#1413243510
sudo update-alternatives --set java /export/apps/jdk/JDK-1_8_0_5
#1413243519
cd /etc
#1413243530
man update-alternativesw
#1413243531
man update-alternatives
#1413243717
sudo alternatives --config java
#1413243730
sudo update-alternatives --display java
#1413245414
ssh lva1-app7819.prod.linkedin.com
#1413316123
mtr
#1413316128
sudo mtr peterson.ath.cx
#1413316144
ssh -p 2222 root@peterson.ath.cx
#1413396144
remember amyl
#1413396147
remember amil
#1413396152
remember tript
#1412799823
ssh ltx1-app7809.prod.linkedin.com
#1412799902
ssh ltx1-app7715.prod.linkedin.com
#1412802728
ssh ltx1-admin01.prod.linkedin.com
#1412804229
vi .bashrc
#1412804229
remember
#1412698838
ls ll
#1412698838
ls dd
#1412698838
less ll
#1412698838
rm ll
#1412698838
diff .bashrc \#.bashrc# 
#1412698838
vi .bashrc
#1412698838
remember
#1412698840
cd work
#1412698848
cd inGraphs/
#1412698852
svin up
#1412698872
cd common-templates/
#1412698876
ls *cloud*
#1412698899
grep -i qps *
#1412698908
grep -i qps cloud*
#1412698916
grep -i qps cloud* | less
#1412698947
vi cloud
#1412698991
grep -i alert cloud*
#1412699003
emacs -nw cloud-SLA2
#1412699058
grep -il autoalert cloud*
#1412699214
grep review ~/cheat*
#1412702399
svin review -g sna-sre-reviewers
#1412705064
exit
#1412617491
tmux attach
#1412705088
exit
#1412804251
eh -e %prod-ltx1.host_tags:ltx1-app10023.prod.linkedin.com
#1412806803
vi
#1412806856
dc
#1412807051
scrabler3 .gesrow
#1412807776
awk '{s += $1} END { m = s / 60; print s, m}' /tmp/j1
#1412807787
awk '{s += $1} END { m = int(s / 60); print s, m}' /tmp/j1
#1412807799
awk '{s += $1} END { m = int(s / 60); s = s % 60; print s, m}' /tmp/j1
#1412807806
awk '{s += $1} END { m = int(s / 60); s = s % 60; print m, s}' /tmp/j1
#1412807890
fg
#1412807939
sed -e 's/^.* in //' /tmp/j1 | awk '{s += $1} END { m = int(s / 60); s = s % 60; print m, s}' 
#1412808039
sed -e 's/^.* in //' /tmp/j2 | awk '{s += $1} END { m = int(s / 60); s = s % 60; print m, s}' 
#1412808444
for f in /tmp/j1 /tmp/j2; do echo -n "$f "; sed -e 's/^.* in //' $f | awk '{s += $1} END { m = int(s / 60); s = s % 60; print m, s}' ; done
#1412811399
vi /tmp/j3
#1412812658
ssh ltx1-app9159.prod.linkedin.com
#1412812777
cd Downloads/
#1412812780
mkdir pp
#1412812781
cd pp
#1412812784
unzip ../good\ pics.zip 
#1412812982
jobs
#1412812984
vi /tmp/j2
#1412813586
vi /tmp/j1
#1412813710
for f in /tmp/j1 /tmp/j2 /tmp/j3; do echo -n "$f "; sed -e 's/^.* in //' $f | awk '{s += $1} END { m = int(s / 60); s = s % 60; print m, s}' ; done
#1412814496
scrabler3 ag
#1412814514
scrabler3 aaolqsb
#1412814518
scrabler3 aaolqsb ao
#1412814525
scrabler3 og
#1412814549
scrabler3 
#1412814667
eh -e %prod-ltx1.tag_hosts:cloud-session.25
#1412814897
remember cvs
#1412815798
vi Dropbox/memory.txt
#1412888809
scrabler3 turghvsr r
#1412888822
scrabler3 turghvsl l
#1412888860
scrabler3 gvsozeo
#1412888873
scrabler3 gvsozeor r
#1412888887
scrabler3 gvsozeot t
#1412888895
scrabler3 gvsozeoh h
#1412888908
scrabler3 gvsozeou u
#1412888943
scrabler3 gvsozeoi i
#1412888965
scrabler3 gvsozeofrail frail
#1412888974
scrabler3 gvsozeothurl thurl
#1412888992
scrabler3 gvsozeo s
#1412889035
scrabler3 gvsozeof f
#1412889049
scrabler3 gvsozeoo o
#1412889091
scrabler3 oa
#1412889099
scrabler3 ea
#1412889115
scrabler3 gvsozeoa ea
#1412890087
gong
#1412890101
pulseaudio -h
#1412890117
pulseaudio --check
#1412890118
echo $?
#1412890134
pulseaudio --kill
#1412890202
kill 13334
#1412890597
remember twitter
#1412890631
ps guaxww | grep pulse
#1412890668
cd Videos/
#1412890671
cd Tale\ Spin/
#1412890672
ls
#1412890678
mplayer Tale\ Spin\ S1E01.mkv 
#1412890715
cd
#1412890722
ps guaxww | grep firefox
#1412890731
kill 13891
#1412890678
mplayer Tale\ Spin\ S1E01.mkv 
#1412890722
ps guaxww | grep firefox
#1412890731
kill 13891
#1416946085
ls -al .davfs2
#1416946098
grep use_locks .davfs2/davfs2.conf
#1416946102
vi .davfs2/davfs2.conf
#1416946125
chmod go-r .davfs2/secrets 
#1416946128
mount box.com
#1416946147
ls box.com
#1416946156
cd box.dom 
#1416946159
cd box.com
#1416946160
df -h .
#1416946183
mkdir japeters-ld1
#1416946185
cd japeters-ld1
#1416946189
d=`pwd`
#1416946190
cd
#1416946191
ls
#1416946204
diff .bashrc \#.bashrc# 
#1416946231
laf -1 > home
#1416946233
vi home
#1416951305
eh -e %prod-ltx1.tag_hosts:cloud-session.25
#1416951495
fg
#1416951497
exit
top
top
top
w
exec top
#1419874403
exit
#1419874404
exit
#1419816560
top
#1419816560
top
#1419816560
w
#1419816560
exec top
#1419883724
history | grep united
#1419883739
set | grep -i history
#1419883811
vi .bashrc
#1419883825
HISTTIMEFORMAT='%F %T '
#1419883830
history | grep vi
#1419883838
man bash
#1419883866
set | grep -i hist
#1419883877
man strftime
#1419883893
less .bash_history 
#1419884637
ssh zugzug2 -p 5190
#1419884784
ssh d14387.dedi.unifiedlayer.com
#1420054262
man file
#1420054318
less /usr/share/file/magic
#1420054349
less /usr/share/file/magic/pdf
#1420063068
ifconfig -a
#1420063075
ifconfig en0
#1420063104
ifconfig en3
#1420063117
mtr 8.8.8.8
#1420066715
cd Dropbox/Documents/Newsletter/
#1420066722
emacs bdays.txt
#1420213069
cd
#1420213076
cd Personal/Documents/Teaching/BSD_Mag/BSD_Firewall_VPN/
#1420213076
ls
#1420213085
vi ~/.emacs
#1420213120
mv module_1 module_1.gfm
#1420213126
emacs module_1.gfm 
#1420213370
emacs
#1420748996
find . -type f -print | xargs grep PJS-4.2 /dev/null
#1420749130
find . -type f -print0 | xargs grep PJS-4.2 /dev/null
#1420749137
find . -type f -print0 | xargs -0grep PJS-4.2 /dev/null
#1420749141
find . -type f -print0 | xargs -0 grep PJS-4.2 /dev/null
#1420749150
cd /Applications/
#1420749151
ls
#1420749154
rm -rf Managed\ Software\ Center.app/
#1420749157
cd Utilities/
#1420749159
rm -rf Managed\ Software\ Update.app 
#1420749191
find / -type f -print0 | xargs -0 grep -l "Managed Software Update" /dev/null
#1420750718
find / -type f -print0 | xargs -0 grep -l "Hot Deals" /dev/null
#1420750732
find /Users/janpeterson/ -type f -print0 | xargs -0 grep -l "Hot Deals" /dev/null
#1420751307
xs
#1420751309
cd
#1420751311
pwd
#1412804229
vi .bashrc
#1412804229
remember
#1412698838
ls ll
#1412698838
ls dd
#1412698838
less ll
#1412698838
rm ll
#1412698838
diff .bashrc \#.bashrc# 
#1412698838
vi .bashrc
#1412698838
remember
#1412698840
cd work
#1412698848
cd inGraphs/
#1412698852
svin up
#1412698872
cd common-templates/
#1412698876
ls *cloud*
#1412698899
grep -i qps *
#1412698908
grep -i qps cloud*
#1412698916
grep -i qps cloud* | less
#1412698947
vi cloud
#1412698991
grep -i alert cloud*
#1412699003
emacs -nw cloud-SLA2
#1412699058
grep -il autoalert cloud*
#1412699214
grep review ~/cheat*
#1412702399
svin review -g sna-sre-reviewers
#1412705064
exit
#1412617491
tmux attach
#1412705088
exit
#1412804251
eh -e %prod-ltx1.host_tags:ltx1-app10023.prod.linkedin.com
#1412806856
dc
#1412807051
scrabler3 .gesrow
#1412807776
awk '{s += $1} END { m = s / 60; print s, m}' /tmp/j1
#1412807787
awk '{s += $1} END { m = int(s / 60); print s, m}' /tmp/j1
#1412807799
awk '{s += $1} END { m = int(s / 60); s = s % 60; print s, m}' /tmp/j1
#1412807806
awk '{s += $1} END { m = int(s / 60); s = s % 60; print m, s}' /tmp/j1
#1412807890
fg
#1412807939
sed -e 's/^.* in //' /tmp/j1 | awk '{s += $1} END { m = int(s / 60); s = s % 60; print m, s}' 
#1412808039
sed -e 's/^.* in //' /tmp/j2 | awk '{s += $1} END { m = int(s / 60); s = s % 60; print m, s}' 
#1412808444
for f in /tmp/j1 /tmp/j2; do echo -n "$f "; sed -e 's/^.* in //' $f | awk '{s += $1} END { m = int(s / 60); s = s % 60; print m, s}' ; done
#1412811399
vi /tmp/j3
#1412812658
ssh ltx1-app9159.prod.linkedin.com
#1412812780
mkdir pp
#1412812781
cd pp
#1412812784
unzip ../good\ pics.zip 
#1412812982
jobs
#1412812984
vi /tmp/j2
#1412813586
vi /tmp/j1
#1412813710
for f in /tmp/j1 /tmp/j2 /tmp/j3; do echo -n "$f "; sed -e 's/^.* in //' $f | awk '{s += $1} END { m = int(s / 60); s = s % 60; print m, s}' ; done
#1412814496
scrabler3 ag
#1412814514
scrabler3 aaolqsb
#1412814518
scrabler3 aaolqsb ao
#1412814525
scrabler3 og
#1412814549
scrabler3 
#1412814667
eh -e %prod-ltx1.tag_hosts:cloud-session.25
#1412814897
remember cvs
#1412888809
scrabler3 turghvsr r
#1412888822
scrabler3 turghvsl l
#1412888860
scrabler3 gvsozeo
#1412888873
scrabler3 gvsozeor r
#1412888887
scrabler3 gvsozeot t
#1412888895
scrabler3 gvsozeoh h
#1412888908
scrabler3 gvsozeou u
#1412888943
scrabler3 gvsozeoi i
#1412888965
scrabler3 gvsozeofrail frail
#1412888974
scrabler3 gvsozeothurl thurl
#1412888992
scrabler3 gvsozeo s
#1412889035
scrabler3 gvsozeof f
#1412889049
scrabler3 gvsozeoo o
#1412889091
scrabler3 oa
#1412889099
scrabler3 ea
#1412889115
scrabler3 gvsozeoa ea
#1412890087
gong
#1412890101
pulseaudio -h
#1412890117
pulseaudio --check
#1412890118
echo $?
#1412890134
pulseaudio --kill
#1412890202
kill 13334
#1412890597
remember twitter
#1412890631
ps guaxww | grep pulse
#1412890668
cd Videos/
#1412890671
cd Tale\ Spin/
#1412890678
mplayer Tale\ Spin\ S1E01.mkv 
#1412890722
ps guaxww | grep firefox
#1412890731
kill 13891
#1412890678
mplayer Tale\ Spin\ S1E01.mkv 
#1412890722
ps guaxww | grep firefox
#1412890731
kill 13891
#1416946085
ls -al .davfs2
#1416946098
grep use_locks .davfs2/davfs2.conf
#1416946102
vi .davfs2/davfs2.conf
#1416946125
chmod go-r .davfs2/secrets 
#1416946128
mount box.com
#1416946147
ls box.com
#1416946156
cd box.dom 
#1416946159
cd box.com
#1416946160
df -h .
#1416946183
mkdir japeters-ld1
#1416946185
cd japeters-ld1
#1416946189
d=`pwd`
#1416946204
diff .bashrc \#.bashrc# 
#1416946231
laf -1 > home
#1416946233
vi home
#1416951305
eh -e %prod-ltx1.tag_hosts:cloud-session.25
#1416951495
fg
#1416951497
exit
#1419816554
top
#1419816554
top
#1419816554
top
#1419816554
w
#1419816554
exec top
#1419817019
remember vonage
#1419881896
scrabler3 vstaut.
#1419881916
scrabler3 vstaut.w ^w.$
#1419881930
scrabler3 vstaut.o [eo]o$
#1419881946
scrabler3 vstaut.in in
#1419881984
scrabler3 vstaut.z ^z.$
#1419881992
scrabler3 vstaut.in ina
#1419882030
scrabler3 tut.tdo
#1419882043
scrabler3 tut.tdoo [oe]o$
#1419882063
scrabler3 tut.tdog ^g.$
#1419882074
scrabler3 tut.tdoo eoo
#1419882113
scrabler3 tut.tdodive dive
#1419882137
scrabler3 tut.tdo d.?$
#1419882153
scrabler3 tut.tdo ....d.?$
#1419882191
scrabler3 oujnoii
#1419882195
scrabler3 oujnoiif f
#1419882208
scrabler3 oujnoii
#1419882225
scrabler3 oujnoiim m
#1419882235
scrabler3 oujnoiire rej
#1419884652
remember unifiedlayer
#1419884661
memorize d14387.dedi.unifiedlayer.com
#1419884721
vi Dropbox/memory.txt
#1419892772
scrabler3 tut.tdoricer ricer
#1419892782
scrabler3 tut.tdo p
#1419892810
scrabler3 tut.tdo p.
#1419892901
scrabler3 tttyfta
#1419892914
scrabler3 tttyftao ^o
#1419912642
remember liberty
#1419912875
5085018
#1419912900
memorize
#1419916666
remember esurance
#1420059382
hostname
#1420224130
scrabler3 quashc.
#1420224155
scrabler3 quashc.n ns$
#1420224185
scrabler3 quashc.t t$
#1420224237
scrabler3 quashc.wet wet
#1420224252
scrabler3 quashc.t ts
#1420224294
scrabler3 mogoaaj
#1420224305
scrabler3 mogoaajow ow.
#1420224317
scrabler3 mogoaajt t$
#1420224357
scrabler3 mogoaajow ^.ow$
#1420224367
scrabler3 mogoaajon n[mj]
#1420224419
scrabler3 mogoaajn n$
#1420224455
scrabler3 mogoaajxi xi.$
#1420224502
scrabler3 eftane
#1420224507
scrabler3 eftane eftane
#1420224522
scrabler3 mogoaajsail sail
#1420224532
scrabler3 mogoaajado ado
#1420224540
scrabler3 mogoaajrug rug
#1420224553
scrabler3 mogoaaj ^..a.$
#1420224600
scrabler3 ojaieen
#1420224613
scrabler3 ojaieenn nj
#1420224631
scrabler3 ojaieenne ne
#1420224646
scrabler3 ojaieeno o...
#1420224655
scrabler3 ojaieeng g.j
#1420224679
scrabler3 ojaieenow ow
#1420224690
scrabler3 ojaieenne ne.
#1420224702
scrabler3 ojaieen ee$
#1420224767
scrabler3 ojaieen ne$
#1420225197
scrabler3 oieolid
#1420225204
scrabler3 oieolide e$
#1420225243
scrabler3 oieolidv ov
#1420225294
scrabler3 oieolidj ^j.$
#1420225324
scrabler3 oieolidown own
#1420225337
scrabler3 oieolidn nd$
#1420225360
scrabler3 iioooin
#1420225382
scrabler3 iioooindown down.
#1420225399
scrabler3 iioooinl l..
#1420225462
scrabler3 iioooinc ^c.$
#1420225486
scrabler3 iioooine ^e
#1420225492
scrabler3 iioooinr ^r
#1420225502
scrabler3 iioooint ^t
#1420227161
scrabler3 iinio
#1420227183
scrabler3 iinioe e$
#1420227207
scrabler3 iiniov ov
#1420227222
scrabler3 iinioj ^j.$
#1420227248
scrabler3 iinioh h.
#1420227258
scrabler3 iinioe eo
#1420227271
scrabler3 iinioe ei
#1420227295
scrabler3 iinioop op
#1420227316
scrabler3 iiniot t$
#1420227358
scrabler3 onita
#1420236165
scrabler3 neqendg
#1420236174
scrabler3 neqendgl l....$
#1420236196
scrabler3 neqendgx x..
#1420236247
scrabler3 nqngepv
#1420236252
scrabler3 nqngepve e
#1420236280
scrabler3 nqngepve ^.e$
#1420236315
scrabler3 nqngeppe
#1420236324
scrabler3 nqngepve pe
#1420239459
scrabler3 oroatae .....
#1420245779
scrabler3 otqgtzy
#1420245785
scrabler3 otqgtzyrut rut
#1420245793
scrabler3 otqgtzyo o
#1420340911
scrabler3 hungqedp p
#1420340933
scrabler3 hungqed
#1420340944
scrabler3 hungqedee e.e
#1420340960
scrabler3 hungqedxi xi
#1420341028
scrabler3 hungqeds s
#1420341078
scrabler3 hungqedl l
#1420341115
scrabler3 oqoytgl
#1420341125
scrabler3 oqoytglt t
#1420406966
scrabler4 ravgz.i
#1420407003
scrabler4 ravgz.im m
#1420407099
scrabler4 qeorras
#1420407114
scrabler4 qeorras
#1420407123
scrabler4 -s qa
#1420407191
scrabler4 qeorras s$
#1420407221
scrabler4 qerjvdm
#1420407241
scrabler4 qerjvdmu
#1420407265
scrabler4 qerjvdmo ..o
#1420407300
scrabler4 vg.acea
#1420407319
scrabler4 vg.aceak k...
#1420409416
cd /Volumes/
#1420409418
cd dav
#1420409443
cd mac_home
#1420409447
ls -aF
#1420409458
ls VirtualBox\ VMs/
#1420422764
scrabler4 qrvdmce
#1420422773
scrabler4 qrvdmcep p
#1420422789
scrabler4 qrvdmceb b
#1420422840
scrabler4 qrvdmcesfa fa....s
#1420422856
scrabler4 qrvdmces s
#1420422947
scrabler4 qrvdmcer r
#1420423033
scrabler4 qrvming
#1420423095
scrabler4 qrvmingp p
#1420423165
scrabler4 qrvmingfa fa
#1420423260
scrabler4 .vgacea
#1420471197
mtr jay1.jay-one.org
#1420471250
ping jay1.jay-one.org
#1420476633
scrabler4 -s ^.g$
#1420476724
scrabler4 -s ^v.$
#1420476728
scrabler4 -s ^.v$
#1420476754
scrabler4 -s ^gef$
#1420476759
scrabler4 -s ^nef$
#1420486079
remember portal
#1420486088
remember adp
#1420488736
unzip -l Adafruit_NeoPixel-master.zip 
#1420488739
unzip Adafruit_NeoPixel-master.zip 
#1420488741
cd Adafruit_NeoPixel-master
#1420488745
cd examples/
#1420488749
cd buttoncycler/
#1420488752
less buttoncycler.ino 
#1420491867
scrabler4 eatpots
#1420494877
remember myuhc
#1420502242
mkpw --num-pws=20
#1420502820
lpq
#1420562677
vi
#1420674201
man ssh_config
#1420674916
remember last.fm
#1420681378
scrabler4 nirvina
#1420681390
scrabler4 nirvinac ^c.$
#1420681400
scrabler4 nirvina
#1420681445
scrabler4 nirvinaab ab
#1420681454
scrabler4 nirvinaq q
#1420681464
scrabler4 nirvinas s.?$
#1420681472
scrabler4 nirvinat t$
#1420681488
scrabler4 nirvinaowe owe$
#1420681497
scrabler4 nirvinaperm perm.?$
#1420681506
scrabler4 nirvinati ti
#1420681538
scrabler4 nirvinay y
#1420681556
scrabler4 nirvinait it
#1420681565
scrabler4 nirvinadew dew.
#1420681582
scrabler4 nirvinatit tait
#1420681595
scrabler4 nirvinarei rei
#1420681607
scrabler4 nirvinah nh
#1420681618
scrabler4 nirvinash s.nh
#1420681639
scrabler4 lnqrnut
#1420681646
scrabler4 lnqrnutapnea apnea
#1420681654
scrabler4 lnqrnut l
#1420681674
scrabler4 lnqrnuta a
#1420681687
scrabler4 lnqrnute e
#1420681708
scrabler4 lnqrnutn n
#1420681728
scrabler4 nltcira
#1420737973
scrabler4 cilantr
#1420737993
scrabler4 cilantrl l$
#1420738000
scrabler4 ga
#1420738008
scrabler4 cilantrd d$
#1420738039
scrabler4 cilantrda d.a$
#1420738058
scrabler4 cilantrya ya
#1420738084
scrabler4 cilantrin in
#1420738096
scrabler4 cilantrtold told
#1420738106
scrabler4 cilantrg g$
#1420738123
scrabler4 cilantrgores gores
#1420738153
scrabler4 cilantroy oy
#1420739253
ps gauxww | grep chrome
#1420739256
ps gauxww | grep google
#1420741038
remember rideuta
#1420741130
ps guaxww | grep chrome
#1420743445
cd Library/WebTools/
#1420743453
less UpdateAgent/test.sh 
#1420743459
less UpdateAgent/run_update.sh 
#1420743470
rm -rf UpdateAgent/
#1420743476
rmdir WebTools
#1420743477
lf
#1420743506
cd PreferencePanes/
#1420743513
cd ../Safari
#1420743517
cd Extensions/
#1420743523
rm -rf Extensions/
#1420743566
cd LaunchAgents/
#1420743590
less com.genieo.completer.download.plist 
#1420743633
rm -rf com.genieo.completer.* com.webhelper.plist com.webtools.update.agent.plist  com.crossrider.wss002501.agent.plist flashmall* 
#1420743660
cd Logs
#1420743668
cd Cookies/
#1420743678
rm Cookies.binarycookies 
#1420743703
cd Dock
#1420743712
rm desktoppicture.db 
#1420743721
ls CrashReporter/
#1420743724
rm -rf CrashReporter/
#1420743728
ls Mozilla/
#1420743733
rm -rf Mozilla/
#1420743741
rm -rf webHelperApp/
#1420743754
rm -rf com.genieoinnovation.Installer/
#1420743805
rm -rf com.apple.keychainaccess.savedState com.apple.finder.savedState com.google.Chrome.savedState
#1420743836
cd Keychains/
#1420743846
cd ../Caches/
#1420743848
ls -lt 
#1420743852
ls -lt  | head -20
#1420743939
rm -rf com.apple.iChat com.apple.nsservicescache.plist TemporaryItems com.apple.commerce com.genieoinnovation.Installer WebSocketServerApp cr-extension.cr-silent com.bundlore.mac-os-x-installer/ com.vladalexa.MagicPrefs 
#1420743955
cd Safari
#1420743957
ls -lt
#1420743966
ls -lt | head -20
#1420743977
cd logs
#1420744965
cd Applications/
#1420744988
ls Chrome\ Apps.localized/Icon 
#1420745021
find / -name "Managed*" -print
#1420745025
find / -name "Managed*" -print 2>/dev/null
#1420745124
cd Library
#1420745192
cd /Applications/Utilities/
#1420745195
cd Managed\ Software\ Update.app 
#1420745197
file Managed\ Software\ Update.app 
#1420745203
sudo rm Managed\ Software\ Update.app 
#1420746132
ced
#1420746137
find / -name "Managed Software Update.app" -print 2>/dev/null
#1420746194
sudo rm -rf Managed\ Software\ Center.app/
#1420746205
sudo rm -rf Managed\ Software\ Update.app 
#1420746379
cd Utilities/
#1420746384
cd /
#1420746387
cd Library/
#1420746395
cd Application\ Support/
#1420746415
cd Saved\ Application\ State/
#1420746425
cd com.google
#1420746428
cd com.google.Chrome.savedState/
#1420746432
ls -al
#1420746434
less *
#1420746505
cd Downloads/
#1420746509
ls -lt | head
#1420746514
cd 
#1420746518
ls -alt | head
#1420746616
find . -type f -print | xargs grep "Hot Deals" /dev/null
#1420746639
find . -type f -print0 | xargs -0 grep "Hot Deals" /dev/null
#1420747242
find . -type f -print0 | xargs -0 grep "PJS-4.2" /dev/null
#1420748866
less Library/Caches/Google/Chrome/Default/Cache/data_1
#1420748908
grep PJS-4.2 Library/Caches/Google/Chrome/Default/Cache/data_1
#1420748914
strings Library/Caches/Google/Chrome/Default/Cache/data_1 | less
#1420748936
cd Library/Caches/Google
#1420748938
cd Chrome/
#1420748942
cd ..
#1420748944
rm -rf Chrome/
#1420748946
cd
#1420748957
cd /Applications/
#1420748961
rm -rf Managed\ Software\ Center.app/
#1420748968
cd Managed\ Software\ Center.app/
#1420748968
ls
#1420748976
sudo bash
#1416946204
diff .bashrc \#.bashrc# 
#1416946231
laf -1 > home
#1416946233
vi home
#1416951305
eh -e %prod-ltx1.tag_hosts:cloud-session.25
#1416951495
fg
#1420046333
top
#1420046333
top
#1420046333
top
#1420046333
w
#1420046333
exec top
#1420047427
mtr irc.bluehost.com
#1420047490
mtr jay1.jay-one.org
#1420047846
ifconfig en0
#1420047848
mtr 8.8.8.8
#1420655667
aH-aH-aH-aH-aH-aH-aH-aH-aH-
#1420655670
ssh -p 2222 jlp@jay1.jay-one.org
#1420751584
exit
#1419816560
exec top
#1419874278
ssh -p 2222 jlp@jay1.jay-one.org
#1419991764
mosh jlp@jay1.jay-one.org
#1420180545
fg
#1420564296
mosh --ssh="ssh -p 2222" jlp@jay1.jay-one.org
#1420751591
exit
#1412890117
pulseaudio --check
#1412890118
echo $?
#1412890134
pulseaudio --kill
#1412890202
kill 13334
#1412890597
remember twitter
#1412890631
ps guaxww | grep pulse
#1412890668
cd Videos/
#1412890671
cd Tale\ Spin/
#1412890678
mplayer Tale\ Spin\ S1E01.mkv 
#1412890722
ps guaxww | grep firefox
#1412890731
kill 13891
#1412890678
mplayer Tale\ Spin\ S1E01.mkv 
#1412890722
ps guaxww | grep firefox
#1412890731
kill 13891
#1416946085
ls -al .davfs2
#1416946098
grep use_locks .davfs2/davfs2.conf
#1416946102
vi .davfs2/davfs2.conf
#1416946125
chmod go-r .davfs2/secrets 
#1416946128
mount box.com
#1416946147
ls box.com
#1416946156
cd box.dom 
#1416946159
cd box.com
#1416946160
df -h .
#1416946183
mkdir japeters-ld1
#1416946185
cd japeters-ld1
#1416946189
d=`pwd`
#1416946204
diff .bashrc \#.bashrc# 
#1416946231
laf -1 > home
#1416946233
vi home
#1416951305
eh -e %prod-ltx1.tag_hosts:cloud-session.25
#1416951495
fg
#1420678282
top
#1420678282
top
#1420678282
top
#1420678282
w
#1420678282
exec top
#1420678295
ssh controller1.dedi.unifiedlayer.com
#1420745408
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --help
#1420745426
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --safe
#1420745451
file \^
#1420745455
less \^
#1420745460
rm \^
#1420745463
cd /Applications/
#1420745467
ls -lt \ head
#1420745474
cd Utilities/
#1420745486
cd ../Google\ Chrome.app/
#1420745489
cd Contents/
#1420745496
lf MacOS/
#1420745500
cd MacOS/
#1420745502
file Google\ Chrome 
#1420745509
cd Resources/
#1420745509
lf
#1420745534
cdd Google/
#1420745543
cd GoogleSoftwareUpdate/
#1420745544
ls -al
#1420745548
cd ../../
#1420745561
cd Preference
#1420745562
cd Preferences
#1420745568
cd ByHost/
#1420745589
ls -tl | head
#1420745596
rm -rf ByHost 
#1420745599
cd ..
#1420745602
cd /Library/
#1420745607
cd Google/
#1420745674
cd Library/
#1420745693
ls -lt | head -20
#1420746953
cd Downloads/
#1420746953
ls
#1420746964
ls -lt | head
#1420750913
cd
#1420750926
curl http://www.adwaremedic.com/AdwareMedic.dmg -O
#1420751246
remember farepay
#1420751594
exit
#1420750282
cd /private/var/log
#1420750284
less install.log
#1420750547
less system.log
#1420750594
cd /private/var/db/receipts/
#1420750606
less com.googlecode.munki.app.bom
#1420751597
exit
#1420745710
cd Pref
#1420745714
cd Library
#1420745716
cd Preferences
#1420745717
ls
#1420745719
ls -lt | head
#1420745754
ls -lt | head -20
#1420750271
sudo bash
#1420751598
exit
#1412888908
scrabler3 gvsozeou u
#1412888943
scrabler3 gvsozeoi i
#1412888965
scrabler3 gvsozeofrail frail
#1412888974
scrabler3 gvsozeothurl thurl
#1412888992
scrabler3 gvsozeo s
#1412889035
scrabler3 gvsozeof f
#1412889049
scrabler3 gvsozeoo o
#1412889091
scrabler3 oa
#1412889099
scrabler3 ea
#1412889115
scrabler3 gvsozeoa ea
#1412890087
gong
#1412890101
pulseaudio -h
#1412890117
pulseaudio --check
#1412890118
echo $?
#1412890134
pulseaudio --kill
#1412890202
kill 13334
#1412890597
remember twitter
#1412890631
ps guaxww | grep pulse
#1412890668
cd Videos/
#1412890671
cd Tale\ Spin/
#1412890678
mplayer Tale\ Spin\ S1E01.mkv 
#1412890722
ps guaxww | grep firefox
#1412890731
kill 13891
#1412890678
mplayer Tale\ Spin\ S1E01.mkv 
#1412890722
ps guaxww | grep firefox
#1412890731
kill 13891
#1416946085
ls -al .davfs2
#1416946098
grep use_locks .davfs2/davfs2.conf
#1416946102
vi .davfs2/davfs2.conf
#1416946125
chmod go-r .davfs2/secrets 
#1416946128
mount box.com
#1416946147
ls box.com
#1416946156
cd box.dom 
#1416946159
cd box.com
#1416946160
df -h .
#1416946183
mkdir japeters-ld1
#1416946185
cd japeters-ld1
#1416946189
d=`pwd`
#1416946204
diff .bashrc \#.bashrc# 
#1416946231
laf -1 > home
#1416946233
vi home
#1416951305
eh -e %prod-ltx1.tag_hosts:cloud-session.25
#1416951495
fg
#1419816560
top
#1419816560
top
#1419816560
top
#1419816560
w
#1419816560
exec top
#1419874530
remember esurance
#1419893504
whois trololololololololololo.com
#1419895370
mkpw --num-pws=10
#1419895910
which comma
#1419965261
aspell -a
#1419969843
scrabler3 ttturaeg ....g
#1419970079
scrabler3 ounoeqi
#1419970085
scrabler3 ounoeqia a
#1419970127
scrabler3 ounoeqin n
#1419970197
scrabler3 ounoeqiu u
#1419970952
scrabler3 ueooyis
#1419970958
scrabler3 ueooyisv v
#1419970964
scrabler3 ueooyise e
#1419970968
scrabler3 ueooyisg g
#1419976763
scrabler3 gridbtk
#1419976802
scrabler3 fetidoov v
#1419976809
scrabler3 fetidooa a
#1419976821
scrabler3 fetidoo
#1419976891
scrabler3 gdeih.sv v
#1419976896
scrabler3 gdeih.sa a
#1419976960
scrabler3 gdeih.s
#1419983419
scrabler3 dljtrio
#1419983523
scrabler3 dljtriot .tt
#1419983533
scrabler3 dljtriot tt
#1419983542
scrabler3 dljtrioo oo
#1419983605
scrabler3 jitlacr
#1419983621
scrabler3 jitlacro jo[ia]
#1419984135
wget
#1419984137
curl
#1419984149
curl http://rdo.fedorapeople.org/openstack-juno/rdo-release-juno.rpm
#1419984164
curl https://rdo.fedorapeople.org/openstack-juno/rdo-release-juno.rpm
#1419984189
curl https://repos.fedorapeople.org/repos/openstack/openstack-juno/rdo-release-juno.rpm
#1419984200
curl https://repos.fedorapeople.org/repos/openstack/openstack-juno/rdo-release-juno-1.noarch.rpm
#1419984206
curl https://repos.fedorapeople.org/repos/openstack/openstack-juno/rdo-release-juno-1.noarch.rpm -O
#1419984256
file rdo-release-juno-1.noarch.rpm 
#1419984260
head rdo-release-juno-1.noarch.rpm
#1419984266
od -c rdo-release-juno-1.noarch.rpm | head
#1419984283
cpio -it < rdo-release-juno-1.noarch.rpm 
#1419984291
pwd
#1419984301
ls etc
#1419984314
mkdir etc
#1419984317
chmod 777 etc
#1419984333
mkdir etc/yum.repos.d
#1419984341
mkdir -p etc/pki/rpm-gpg
#1419984346
chmod -R 777 etc
#1419984348
cpio -i < rdo-release-juno-1.noarch.rpm 
#1419984351
cd etc
#1419984354
cd yum.repos.d/
#1420069072
scrabler3 oatovrs
#1420180629
ls /Volumes
#1420180787
cd /Volumes/dav
#1420180822
cd Documents
#1420180827
cd Teaching
#1420180834
cd BSD_Mag/
#1420180841
cd ..
#1420180874
tar cf - Teaching | (cd; mkdir -p Personal/Documents; cd Personal/Documents; tar xvf -)
#1420181638
mv markdown-mode.el ~/lib/emacs
#1420212882
cd ~/lib/emacs
#1420213934
less my-bindings.el
#1420213935
make
#1420225923
cat /etc/aliases
#1420228796
help alias
#1420228824
man bash
#1420231854
dc
#1420240801
cd Downloads/
#1420240810
tar tvfz MobilinkdTnc1Config-0.4.1.tar.gz 
#1420240817
tar xvfz MobilinkdTnc1Config-0.4.1.tar.gz 
#1420240820
cd MobilinkdTnc1Config-0.4.1
#1420240834
python 
#1420240855
python setup.py
#1420240882
python MobilinkdTnc1Config.py 
#1420240889
lf
#1420240891
lf glade
#1420240900
which python
#1420240943
python setup.py --help
#1420240952
python setup.py build
#1420240963
python setup.py install
#1420240967
sudo python setup.py install
#1420241159
rudix list python
#1420241166
rudix search python
#1420241170
rudix 
#1420241173
rudix help
#1420241187
rudix --search python
#1420241316
curl https://raw.github.com/jralls/gtk-osx-build/master/gtk-osx-build-setup.sh -O
#1420241347
curl https://raw.github.com/jralls/gtk-osx-build/master/gtk-osx-build-setup.sh
#1420241351
ls -lt | head
#1420241540
cd Downloads/MobilinkdTnc1Config-0.4.1
#1420241547
MobilinkdTnc1Config.py 
#1420241565
less MobilinkdTnc1Config.py 
#1420241637
rudix search gtk
#1420241644
rudix --search gtk
#1420241706
find / -name gi -print
#1420241733
find / -name gi -print 2>/dev/null
#1420342088
scrabler3 qthabdr
#1420342095
scrabler3 qthabdrc ..c
#1420342116
scrabler3 qthabdrto ^...to
#1420342432
scrabler3 formsqd
#1420342502
scrabler3 formsqdb ^b.$
#1420342513
scrabler3 formsqd o$
#1420342525
scrabler3 formsqdy y
#1420342537
scrabler3 formsqde e
#1420342557
scrabler3 formsqdsine sine.$
#1420342563
scrabler3 formsqde e.s
#1420342593
grep -i exalts ~/lib/TWL06.txt 
#1420342608
scrabler3 formsqdge g.e
#1420342640
scrabler3 formsqdexed exed
#1420342672
scrabler3 formsqd os
#1420342775
scrabler3 frqdtet
#1420342783
scrabler3 frqdtetm ....m
#1420342794
scrabler3 frqdtety y
#1420342816
scrabler3 frqdtetge g.e
#1420342826
scrabler3 frqdteti i.
#1420342870
scrabler3 frqdtetg g.
#1420344561
cd bin/scripts/
#1420344566
chmod +x scrabler4
#1420344575
scrabler4 quora
#1420345257
scrabler4 quora ra
#1420345504
scrabler4 -s extant
#1420345594
scrabler4 -s ext.nt
#1420345679
perldoc scrabler4
#1420345934
scrabler4
#1420346079
scrabler4 -s
#1420346168
scrabler4 -q
#1420346171
scrabler4 
#1420346436
scrabler4 hqerroo
#1420346449
scrabler4 hqerroon .n...
#1420346480
scrabler4 hqeroon .n...
#1420346497
scrabler4 hqeroon ^.n
#1420346512
scrabler4 hqeroowon won
#1420346527
scrabler4 hqeroopaid paid
#1420346543
scrabler4 hqerooen en.
#1420346551
scrabler4 hqerooee e.e
#1420346561
scrabler4 hqerookm k.m
#1420346568
scrabler4 hqeroo ^r
#1420401313
scrabler4 qeoirfr
#1420401324
scrabler4 qeoirfrna .na..
#1420401332
scrabler4 qeoirfrna na
#1420402367
cd Personal/Documents/Teaching/BSD_Mag/BSD_Firewall_VPN/
#1420402372
less module_1.gfm 
#1420404472
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
#1420404516
ls -l /var/db/loc*
#1420404555
ps gauxww | grep lco
#1420404557
ps gauxww | grep loca
#1420404748
sudo rudix install pip
#1420404757
sudo rudix install python-pip
#1420404797
locate pip
#1420404801
python
#1420404848
sudo easy_install pip
#1420404856
pip
#1420404863
sudo pip install grip
#1420404928
grip module_1.gfm 
#1420406200
grip --help
#1420406209
grip --gfm module_1.gfm 
#1420415801
grip module_2.gfm 
#1420415807
grip --gfm module_2.gfm 
#1420570243
cd
#1420570244
ls
#1420570476
ssh -v keyserv.unifiedlayer.com
#1420570583
host zugzug2.bluehost.com
#1420570635
ssh -p 5190 zugzug.bluehost.com 
#1420570913
netstat -rn
#1420570928
ssh -p 5190 zugzug2.bluehost.com 
#1420570939
ssh keyserv.unifiedlayer.com
#1420570995
ssh keyserv.unifiedlayer.com 192.163.221.153
#1420571008
ssh -t keyserv.unifiedlayer.com 192.163.221.153
#1420666109
remember schwab
#1420666113
remember
#1420674156
vi .ssh/config
#1420674321
ssh asterisk3.bluehost.com
#1420674343
ssh root@asterisk3.bluehost.com
#1420674360
ssh -v asterisk3.bluehost.com
#1420674812
hg
#1420674816
rudix search hg
#1420677143
ssh zugzug2 -p 5190
#1420677149
ssh zugzug2.bluehost.com -p 5190
#1420678228
ssh controller1.dedi.unifiedlayer.com
#1420736110
remember tripadvisor
#1420742376
mkpw --num-pws=20
#1420742385
memorize
#1420742415
vi Dropbox/memory.txt
#1420751600
exit
#1420474558
irssi
#1420751604
exit
#1416946128
mount box.com
#1416946147
ls box.com
#1416946156
cd box.dom 
#1416946159
cd box.com
#1416946160
df -h .
#1416946183
mkdir japeters-ld1
#1416946185
cd japeters-ld1
#1416946189
d=`pwd`
#1416946204
diff .bashrc \#.bashrc# 
#1416946231
laf -1 > home
#1416946233
vi home
#1416951305
eh -e %prod-ltx1.tag_hosts:cloud-session.25
#1416951495
fg
#1419816560
top
#1419816560
top
#1419816560
top
#1419816560
w
#1419816560
exec top
#1419911205
scrabler3 enlustu
#1419911214
scrabler3 enlustus
#1419911219
scrabler3 enlustua
#1419911231
scrabler3 enlustut
#1419911251
scrabler3 enlustulo lo
#1419911268
scrabler3 enlustus s
#1419911298
scrabler3 enlustua a
#1419911338
scrabler3 enlustua a.t
#1419911375
scrabler3 enlustut t.
#1419911390
scrabler3 enlustut s.t.
#1419912600
remember liberty
#1420046478
ping irc.bluehost.com
#1420046704
mtr irc.bluehost.com
#1420047950
ifconfig en3
#1420048486
scrabler3 mooseaoi ^....i
#1420052362
mtr 8.8.8.8
#1420052425
irssi
#1420405234
less /etc/ssh/sshd_config
#1420405245
ls /etc/sshd_config
#1420405249
less /etc/sshd_config
#1420408238
cd Personal/Documents/Teaching/BSD_Mag/BSD_Firewall_VPN/
#1420408242
wc module_1.gfm 
#1420408252
rm module_1~
#1420408256
rm module_2
#1420408261
rm module_2~
#1420408286
rm module_3
#1420410598
cd VirtualBox\ VMs/
#1420410603
mv OpenBSD\ 1/ ..
#1420410785
cat /Volumes/dav/mac_home/VirtualBox\ VMs/OpenBSD\ 1/OpenBSD\ 1.vdi.xa* > OpenBSD\ 1/OpenBSD\ 1.vdi 
#1420411194
ls -al OpenBSD\ 1/OpenBSD\ 1.v
#1420411195
ls -al OpenBSD\ 1/OpenBSD\ 1.vdi
#1420411206
ls -al OpenBSD\ 1/
#1420412291
cd OpenBSD\ 1/
#1420412421
cat /Volumes/dav/mac_home/VirtualBox\ VMs/OpenBSD\ 1/OpenBSD\ 1.vdi.xa* > ~/OpenBSD\ 1.vdi
#1420412455
file OpenBSD\ 1.vdi 
#1420412796
ssh user1@10.0.2.15
#1420412986
cd Personal/Documents/Teaching/BSD_Mag/
#1420412989
cd BSD_Firewall_VPN/
#1420412998
grep root module_*
#1420413163
less module_1.gfm 
#1420413234
remember root
#1420413262
remember
#1420413326
cd /Volumes/dav
#1420413358
ls Documents/
#1420413388
grep root Documents/Teaching/BSD_Mag/BSD_Firewall_VPN/module_1
#1420413434
cd mac_home
#1420413436
ls
#1420414967
cd Documents/Aspyr/Sid\ Meier\'s\ Civilization\ 5/cd
#1420414973
cd
#1420414975
ifconfig -a
#1420415275
ssh user1@192.168.56.101
#1420751611
exit
#1419977587
ssh v179.vps.unifiedlayer.com
#1419991835
ping 192.168.1.1
#1419991839
ping 8.8.8.8
#1419991844
mtr 8.8.8.8
#1420047662
=gHk0iPk2>&"xxvjog(j
#1420751614
exit
#1420576092
remember prescript
#1420576459
ssh keyserver.unifiedlayer.com 192.168.252.114
#1420576469
ssh keyserv.unifiedlayer.com 192.168.252.114
#1420576496
ssh keyserv.unifiedlayer.com 192.163.252.114
#1420576511
ssh -t keyserv.unifiedlayer.com 192.163.252.114
#1420751617
exit
#1416946231
laf -1 > home
#1416946233
vi home
#1416951305
eh -e %prod-ltx1.tag_hosts:cloud-session.25
#1416951495
fg
#1416951497
exit
#1419816555
top
#1419816555
top
#1419816555
top
#1419816555
w
#1419816555
exec top
#1420409470
ls VirtualBox\ VMs/
#1420409496
cat OpenBSD\ 1.vdi.xa* > OpenBSD\ 1.vdi
#1420409512
vi OpenBSD\ 1.vbox
#1420409544
rm OpenBSD\ 1.vdi.xa*
#1420409559
diff OpenBSD\ 1.vbox-prev OpenBSD\ 1.vbox
#1420409583
cd
#1420409690
cd VirtualBox\ VMs/
#1420409691
ls
#1420409705
pwd
#1420409713
cd OpenBSD\ 1/
#1420409719
grep japeters *
#1420409765
cd ..
#1420409766
ls -al
#1420409776
chmod -R 755 OpenBSD\ 1
#1420409780
ls -al Test
#1420409784
ls -al OpenBSD\ 1/
#1420566626
vi
#1420567843
which -a aspell
#1420567849
which -a ispell
#1420567857
rudix search aspell
#1420567873
rudix search en_US
#1420567883
aspell --help
#1420567913
aspell dicts
#1420751930
remember keepas
#1420754581
ps guaxww | less
#1420755018
ps l2487
#1420755020
ps wwl2487
#1420755036
ps wwl2490
#1420754549
top
#1420758050
cd Downloads/
#1420758052
ls -lt | less
#1420758094
mv Radiant\ Player.app/ ~/Applications/
#1420752362
remember | grep AAFES
#1420752610
remember keepass
#1420753934
ssh -p 2222 jlp@jay1.jay-one.org
