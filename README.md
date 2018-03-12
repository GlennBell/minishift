# Setting Up minishift
## NFS Persistent Storage
### Configure NFS Server
Follow the [Ubuntu Community](https://help.ubuntu.com/community/SettingUpNFSHowTo) instructions.

Set up the `/etc/exports` configuration file

	/export 192.168.42.0/24(rw,root_squash,no_wdelay)

### Configure the Persistent Volume

1. Develop the YAML configuration file to add PV to minishift. See [Using Persistent Volumes](https://docs.openshift.com/enterprise/3.0/dev_guide/persistent_volumes.html), [Persistent Storage](https://docs.openshift.com/container-platform/3.5/architecture/additional_concepts/storage.html) and [Persistent Storage Using NFS](https://docs.openshift.com/container-platform/3.5/install_config/persistent_storage/persistent_storage_nfs.html#install-config-persistent-storage-persistent-storage-nfs) for details.

    An example configuration file is included: `nfs-pv.yml`

2. Add the NFS volume to minishift

    `oc create -f nfs-pv.yml`

3. Verify the PV was created

    `oc get pv`



