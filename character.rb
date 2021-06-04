class Character
  attr_reader :name, :hp, :defence, :speed, :point, :lv
  attr_writer :hp

  def initialize(params)
    @name = params[:name]
    @hp = params[:hp]
    @offence = params[:offence]
    @defence = params[:defence]
    @speed = params[:speed]
    @point = params[:point]
    @lv = params[:lv]
  end
end
