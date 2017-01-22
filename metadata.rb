name 'tyw_hashicorp_vault'
maintainer 'Tyler Wong'
maintainer_email 'ty-w@live.com'
license 'all_rights'
description 'Wrapper cookbook for hashicorp-vault'
long_description 'Installs/Configures tyw_hashicorp_vault'
issues_url 'https://github.com/T-Wong/tyw_hashicorp_vault/issues' if respond_to?(:issues_url)
source_url 'https://github.com/T-Wong/tyw_hashicorp_vault' if respond_to?(:source_url)
version '1.0.0'

depends 'hashicorp-vault', '~> 2.4.0'
depends 'magic_shell', '~> 1.0.0'
