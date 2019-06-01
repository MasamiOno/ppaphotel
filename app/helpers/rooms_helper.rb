module RoomsHelper
    
        def search_validate
            return false if !param_validate(:petname, "お名前を入力してください")
            return true
        end
        
        private
        def param_validate(key, message)
            if params[key] == ""
                flash[:alert] = message
                return false
            end
            
            return true
        end
    end
