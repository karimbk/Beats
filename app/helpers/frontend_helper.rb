module FrontendHelper
	
  def beats_menu_activ(c_name, second = true)
    return 'activ' if action_name == c_name && second
  end
    
  def set_black_footer
    return 'black-text' if action_name == 'index'
  end
end
