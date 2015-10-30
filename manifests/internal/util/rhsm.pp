define jboss::internal::util::rhsm (
      $jboss_user,
      $jboss_group,
      $product          = $jboss::params::product,
      $version          = $jboss::params::version,
      $install_dir      = $jboss::params::install_dir,
   ){
   exec { 'Install JBoss EAP6 Group via Yum':
      unless  => '/usr/bin/yum grouplist "JBoss EAP 6" | /bin/grep "^Installed [Gg]roups"',
      command => '/usr/bin/yum -y groupinstall "JBoss EAP 6"',
   }

   #create symlink directory to match the convention
   file {'$install_dir/$product-$version':
      ensure   => 'link',
      target   => '/usr/share/jbossas',
   }
}
