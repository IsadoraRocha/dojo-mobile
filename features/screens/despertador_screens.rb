require_relative '..\modules\despertador_module.rb'

class DespertadorClass < Appium::Driver
  include DespertadorObjects
  def initialize
      # variaveis de instância que contenham o caminho do elemnto na tela
      @add_novo_despertador = 'fab'
      @icone_alarme = '//android.widget.LinearLayout/xk/android.widget.TextView'
      @horas = '//android.view.View/android.widget.RadialTimePickerView$RadialPickerTouchHelper[1]'
      @botao_ok = 'button1'
  end
end
