use GestionCalzados

Create View VW_Stock as
select C.ID as IDCalzado,C.Modelo as Modelo,T.ID as IDTalle,T.Numero as Talle,Co.ID as IDColor,Co.Color as Color, 
CB.ID as IDColorBase,CB.Color as ColorBase ,S.StockDisponible as Cantidad From Stock as S
Inner join Calzados as C ON C.ID = S.IDCalzado
inner join Talles as T ON T.ID = S.IDTalle
inner join Colores as Co ON Co.ID = S.IDColor 
inner join Colores as CB ON CB.ID =S.IDColorBase


GO

create view VW_Ventas as
Select V.IDCliente,Cal.ID as IDCalzado,Cal.Modelo as Modelo,T.ID as IDTalle, T.Numero as Talle,
Co.ID as IDColor,Co.Color as Color,CB.ID as IDColorBase,CB.Color as ColorBase,CxV.Cantidad as Cantidad from Ventas as V
inner join Clientes as C ON C.ID = V.IDCliente
inner join DatosClientes as DC ON DC.IDCliente = C.ID
inner join Calzados_x_Ventas as CxV ON CxV.IDVenta =V.ID 
inner join Calzados as Cal ON Cal.ID =CxV.IDCalzado
inner join Talles as T ON T.ID = CxV.IDTalle
inner join Colores as Co ON Co.ID = CxV.IDColor
inner join Colores as CB ON CB.ID = CxV.IDColorBase




