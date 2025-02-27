" -------------------------- PONER PÁGINA WEB EN NACIONAL ------------------------------ "
# montar página web
Ver guía de montar web

# crear registro en dns interno
www.geg.cu.  IN      A       172.16.64.179  # dirección en granja interna

# crear registro en dns externo
www.geg.cu.  IN      A       190.6.78.228   # nacional
www.geg.cu.  IN      A       200.55.182.59  # internet

# crear registro en proxy-inverso (192.168.50.59)
