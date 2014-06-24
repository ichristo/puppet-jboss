/**
 * JBoss internals - class that calculates and hold variables calculated at runtime
 */
class jboss::internal::runtime {
  include jboss
  
  $runasdomain   = $jboss::runasdomain
  $profile       = $jboss::profile
  
  $domainconfigfile = 'domain.xml'
  
  $standaloneconfigfile = $profile ? {
    ''        => 'standalone.xml',
    'ha'      => 'standalone-ha.xml',
    'osgi'    => 'standalone-osgi.xml',
    'full'    => 'standalone-full.xml',
    'full-ha' => 'standalone-full-ha.xml',
    default   => 'standalone-full.xml'
  }
  
  $configfile = $runasdomain ? {
    true    => $domainconfigfile,
    default => $standaloneconfigfile,
  }
  
  include jboss::internal::runtime::dc
}