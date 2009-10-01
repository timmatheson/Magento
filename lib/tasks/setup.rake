namespace :magento do
  desc "Install Magento, (requires svn)"
  task :install do
    osx = %x{uname}#,(osx == "Darwin")
    svn = (%x{which svn} != "")
    if osx && svn
      cwd = %x{pwd}
      shebang = %x{which bash}.gsub(/\n/,'')
      installer_script = <<-EOF
      #!#{shebang}/env plain
      cd /Users/#{%x{whoami}.gsub(/\n/,'')}/Sites;
      mkdir -p ./magento-t;
      cd ./magento-t;
      svn co http://svn.magentocommerce.com/source/branches/1.4-trunk;
      cd #{cwd}
      EOF
      puts installer_script
      exec("#{installer_script}")
    else
      puts "Only available for Mac OSX with SVN installed."
    end
  end
end