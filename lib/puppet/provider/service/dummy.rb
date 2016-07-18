Puppet::Type.type(:service).provide :dummy, :parent => :base do
  desc "Dummy service provider"

  def startcmd
		true
  end

  def stopcmd
		true
  end

  def restartcmd
    true
  end

  def statuscmd
    true
  end
end
