class Juun < Formula
  desc "zsh and bash history manager with search and goodies"
  homepage "https://github.com/jackdoe/juun"
  url "https://github.com/jackdoe/juun-bin-dist/raw/master/juun-latest-darwin-amd64.tar.gz"
  version "1.6"
  sha256 "3d4fed937938477bd733a5355d33ba63c96ced90a20d515c6ab416afbc330f85"

  depends_on "vowpal-wabbit"

  def install
        bin.mkpath
        bin.install Dir["*"]
  end

  def caveats; <<-EOS
      In order to start juun you should finish the installation by running:

          sh #{prefix}/bin/install.sh

      This will add juun's setup scrip to your ~/.bash_profile and ~/.zshrc
      When you uninstall make sure you remove juun/dist/setup.sh from them. 

      If you want to import your current history run (after opening new terminal after juun installation):

         HISTTIMEFORMAT= history | #{prefix}/bin/juun.import

      This will add each line of your current history into juun.

      If you want to use the learning functionality, you have to install vowpal-wabbit (brew install vowpal-wabbit),
      juun will use it to learn patterns about which commands you are running in which context and try to improve its search.

      In case you are upgrading juun (from brew upgrade juun), run juun_restart so the new service is started.

      If you run in any issue, please open a ticket at https://github.com/jackdoe/juun, Thanks in advance!
      EOS
  end
end
