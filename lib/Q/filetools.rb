# module Q
  
  # the directory exists or have been created
  FILEDIR_OK = 0

  # the directory could not be created
  FILEDIR_CANTCREATE = 1

  # creates a directory, does not complain, if
  # directory already exists
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
