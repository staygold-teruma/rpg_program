class Character
  attr_accessor :name, :hp, :offence, :defence, :speed, :point, :lv

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
