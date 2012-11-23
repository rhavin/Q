# module Q
  FILEDIR_OK = 0
  FILEDIR_CANTCREATE = 1
  def FileCheckCreateDirectory(dir)
    begin
      if Dir.directory?(dir)
        return FILEDIR_OK
      end
      Dir.mkdir(dir)
    rescue
      return FILEDIR_CANTCREATE
    end
  end 
# end
