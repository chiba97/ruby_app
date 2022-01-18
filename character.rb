class Character
  attr_reader   :name, :offense, :defense
  attr_accessor :hp

  def initialize(**params)
    @name    = params[:name]
    @hp      = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end