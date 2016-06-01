include ntp

class ntp ( $ntpd_servers ) {
    package {
        'ntp':
            ensure  => 'latest';
    }
    file {
        '/etc/ntp.conf':
            ensure  => file,
            mode    => 644,
            require => Package['ntp'],
            content => template('ntp/ntp.tmpl');
    }
    service {
        'ntp':
            enable      => true,
            ensure      => running,
            subscribe   => File['/etc/ntp.conf'];
    }
}
