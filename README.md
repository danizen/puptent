# puptent

Some puppet modules written by Dan as an attempt to show it can be done.
The owner name for all modules is "occs", and each sub-directory is the module name.

This means that a cloned checkout can be used for testing:

```
puppet apply --modulepath . -e 'include ab_python'
```

## Author

Daniel Davis <daniel.davis@nih.gov>

## Vagrantfile

The Vagrantfile defines a CentOS 7 system with enough stuff installed to test this software from the /vagrant mapped directory.

## ab_tomcat

This one is written to be run by the platform user.  

* You build it as anyone:


```
cd ab_tomcat
puppet module build
```

* As platform, you install it in a directory on `/usr/nlm/share` or `/usr/nlm/apps/.puppet/modules`.  For example:

```
puppet module install -i /usr/nlm/share/devops_fs/puppet/modules -f pkg/occs-ab_tomcat-0.2.1.tar.gz
```

* As platform on another box, you can install it like this:


```
puppet apply --modulepath /usr/nlm/share/devops_fs/puppet/modules -e 'include ab_tomcat'
```

Obviously, this doesn't do much more than a shell script run as platform, but
once you are comfortable with it, you can modify the exec resource in
`manifests/init.pp` to run as platform by specifiyng 'user => $user' and 'group
=> $group'.   Then, you can add it to the puppet master and it is easy to be
consistent.


## ab_ruby

Installs rh-ruby 2.2 software collection.

## ab_python

Installs rh-python 3.4 software collection.


## ab_gcc

Installs the yum group "Development Tools", often needed in development to build packages and the like.

## ab_httpd

This is an empty scaffold.

