# Minishift Administration

Refer to the official [Minishift Documentation](https://docs.openshift.org/latest/minishift/index.html) and the [RedHat Container Development Kit](https://developers.redhat.com/products/cdk/overview/)

* [Start Minishift](#start-minishift)
* [Clean Install](#clean-install)
* [NFS Persistent Storage](#nfs-persistent-storage)

## Start minishift

	minishift start
	. ~/bin/minishift_config.sh
	oc login -u system:admin
	docker login -u developer -p $(oc whoami -t) $(minishift openshift registry)

## Clean Install
If minishift has been previously installed:

**Warning! This deletes all minishift configs, projects, etc. **

	minishift stop
	minishift delete
	rm -rf ~/.minishift

Setup minishift environment and configure resources:

	minishift setup-cdk
	minishift config set memory 8GB
	minishift config set disk-size 100GB

Install minishift environment script

	cp minishift_config.sh ~/bin/minishift_config.sh

## NFS Persistent Storage
### Configure NFS Server
Follow the [Ubuntu Community](https://help.ubuntu.com/community/SettingUpNFSHowTo) instructions.

Set up the `/etc/exports` configuration file

	/export 192.168.42.0/24(rw,root_squash,no_wdelay)

### Configure the Persistent Volume

1. Develop the YAML configuration file to add PV to minishift. See [Using Persistent Volumes](https://docs.openshift.com/enterprise/3.0/dev_guide/persistent_volumes.html), [Persistent Storage](https://docs.openshift.com/container-platform/3.5/architecture/additional_concepts/storage.html) and [Persistent Storage Using NFS](https://docs.openshift.com/container-platform/3.5/install_config/persistent_storage/persistent_storage_nfs.html#install-config-persistent-storage-persistent-storage-nfs) for details.

    NFS configuration files are included: `nfs-pv1000.yml` through `nfs-pv1004.yml`

2. Add the NFS volumes to minishift

    `for i in $(ls nfs-pv100[0-4].yaml); do oc create -f $i; done`

3. Verify the PV was created

    `oc get pv`



