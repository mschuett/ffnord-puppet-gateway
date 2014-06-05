class ffnord::resources::repos () {
  apt::source { 'repo.universe-factory':
    location   => 'http://repo.universe-factory.net/debian/',
    release    => 'sid',
    repos      => 'main',
    key        => '16EF3F64CB201D9C',
    key_server => 'pgpkeys.mit.edu';
  }
}