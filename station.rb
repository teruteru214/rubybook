#改札機オブジェクトの作成
umeda = Gate.new(:umeda)
mikuni = Gate.new(:mikuni)

#160円のきっぷを購入して梅田で乗車し、三国で降車する。（NG）
ticket = Ticket.new(160)
umeda.enter(ticket)
mikuni.exit(ticket) # =>false

#190円のきっぷを購入して梅田で乗車し、三国で降車する。（OK）
ticket = Ticket.new(190)
umeda.enter(ticket)
mikuni.exit(ticket) #=> true
