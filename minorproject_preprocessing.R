cosmetics=read.csv(file.choose())
cosmetics
str(cosmetics)
#quantity 
cosmetics$quantity=as.numeric(sapply(strsplit(cosmetics$quantity, " "), "[[", 1))
cosmetics$quantity

cosmetics$quantity <- replace(cosmetics$quantity,is.na(cosmetics$quantity),0 )
cosmetics$quantity

cosmetics$quantity= ifelse(is.na(cosmetics$quantity),
ave(cosmetics$quantity, FUN = function(x) mean(x, na.rm = TRUE)),
                cosmetics$quantity)


#price

cosmetics$price<-lapply(cosmetics$price,gsub,pattern="$",fixed=TRUE,replacement="")
length(cosmetics$price)
str(cosmetics$price)
cosmetics$value_price<-lapply(cosmetics$value_price,gsub,pattern="$",fixed=TRUE,replacement="")
which(is.na(cosmetics$price)>0)
which(is.na(cosmetics$value_price)>0)
cosmetics$price<-as.numeric(cosmetics$price)
cosmetics$value_price<-as.numeric(cosmetics$value_price)
class(cosmetics)
#offer price
cosmetics$offer_percentage=(((cosmetics$value_price-cosmetics$price)/cosmetics$value_price)*100)
cosmetics$offer_percentage
#rating and count
cosmetics$rating<-as.numeric(cosmetics$rating)
cosmetics$rating <- replace(cosmetics$rating, is.na(cosmetics$rating), 0)
cosmetics$ratin
cosmetics$no_of_ratings<-as.numeric(cosmetics$no_of_ratings)
cosmetics$no_of_ratings
cosmetics$no_of_ratings <- replace(cosmetics$no_of_ratings,is.na(cosmetics$no_of_ratings), 1)
cosmetics$no_of_ratings

cosmetics$star_ratio<-cosmetics$rating/cosmetics$no_of_ratings
cosmetics$star_ratio
cosmetics$star_ratio <- replace(cosmetics$star_ratio, is.na(cosmetics$star_ratio), 0)
cosmetics$star_ratio
#ingredients

ingredients<-strsplit(cosmetics$ingredients,split = ',') 

cosmetics$ingredients


cosmetics$price <-cosmetics$price*exchange_rate
                                     
cosmetics$products<-factor(cosmetics$products)
cosmetics$products
write.table(cosmetics,file="file.csv",sep=",")

