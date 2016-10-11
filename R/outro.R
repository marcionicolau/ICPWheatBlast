# require(GPfit)
# require(lhs)
#
#
# n = 7
# x = maximinLHS(n, 1)
# y = matrix(0, n , 1)
#
# computer_simulator <- function(x)
# {
#   log(x + 0.1) + sin(5*pi*x)
# }
#
# y=computer_simulator(x)
# y
#
# GPmodel = GP_fit(x,y)
# print(GPmodel)
# plot(GPmodel)
#
#
#
# getApiWeather = function(sdate, edate, fmt="%d/%m/%Y") {
#   suppressWarnings(require(dplyr))
#   urlBaseWeather = sprintf("http://dev.sisalert.com.br/apirest/api/v1/data/station/564f7cda16af35ca3decd3db/range/%s/%s/output/csv/avgT,avgH,solarR,totR,windS",
#                            strftime(as.Date(sdate, format = fmt), "%m-%d-%Y"),
#                            strftime(as.Date(edate, format = fmt), "%m-%d-%Y"))
#   tmpWeather=read.csv(urlBaseWeather)
#   dt = tmpWeather[,-which(names(tmpWeather) %in% c("weatherStation.id","utcOffset", "interval"), arr.ind = TRUE)]
#   names(dt) = gsub("(.*)\\.(.*)", "\\2", names(dt))
#
#   dt %>% mutate(date=as.Date(as.character(datetime), format = "%m-%d-%Y %H:%M"),
#                 doy = as.numeric(strftime(date, "%j")),
#                 dtime = as.numeric(strftime(strptime(as.character(datetime), format = "%m-%d-%Y %H:%M"),
#                                             format = "%H"))) %>% select(-datetime)
#   # dt
# }
#
# cb1<- function(temp,rh) {
#   ifelse(temp >= 15 && temp <= 35 && rh >= 93,1,0)
# }
#
#
# cb2 = function(temp, rh) {
#   ifelse(between(temp, 15, 35) && rh >= 93, 1, 0)
# }
#
# # Call the cb1 function and apply it in each day in the data frame.
# # pf$cb1 <- round(mapply('cb1', pf$temp, pf$rh),2)
#
#
#
# # Create a new dataset, in a daily basis, with the mean temperature, mean relative humidity, total rainfall and
# # total number of hours that temperature is the range of 15 and 35 C and the sametime RH is equal
# # or greater than 93 %.
# # days<-ddply(pf,.(doy),summarise,temp=mean(temp),rh=mean(rh),rain=sum(rain),
# # cb1=sum(cb1))
#
#
# ab2010 = getApiWeather("01/04/2010","30/11/2010") %>%
#   group_by(name,date) %>% summarise(temp=mean(avgT),
#                                     hr=mean(avgH),
#                                     srad=sum(solarR),
#                                     rain=sum(totR),
#                                     wind=mean(windS),
#                                     doy=min(doy),
#                                     cb=sum(cb1(avgT, avgH))) %>%
#   mutate(scb=cumsum(cb), wcb=cb1(temp,hr), swcb = cumsum(wcb))
#
# ab2011 = getApiWeather("01/04/2011","30/11/2011") %>%
#   group_by(name,date) %>% summarise(temp=mean(avgT),
#                                     hr=mean(avgH),
#                                     srad=sum(solarR),
#                                     rain=sum(totR),
#                                     wind=mean(windS),
#                                     doy=min(doy),
#                                     cb=sum(cb1(avgT, avgH))) %>%
#   mutate(scb=cumsum(cb), wcb=cb1(temp,hr), swcb = cumsum(wcb))
#
#
# ab2012 = getApiWeather("01/04/2012","30/11/2012") %>%
#   group_by(name,date) %>% summarise(temp=mean(avgT),
#                                     hr=mean(avgH),
#                                     srad=sum(solarR),
#                                     rain=sum(totR),
#                                     wind=mean(windS),
#                                     doy=min(doy),
#                                     cb=sum(cb1(avgT, avgH))) %>%
#   mutate(scb=cumsum(cb), wcb=cb1(temp,hr), swcb = cumsum(wcb))
#
# ab2013 = getApiWeather("01/04/2013","30/11/2013") %>%
#   group_by(name,date) %>% summarise(temp=mean(avgT),
#                                     hr=mean(avgH),
#                                     srad=sum(solarR),
#                                     rain=sum(totR),
#                                     wind=mean(windS),
#                                     doy=min(doy),
#                                     cb=sum(cb1(avgT, avgH))) %>%
#   mutate(scb=cumsum(cb), wcb=cb1(temp,hr), swcb = cumsum(wcb))
#
# ab2014 = getApiWeather("01/04/2014","30/11/2014") %>%
#   group_by(name,date) %>% summarise(temp=mean(avgT),
#                                     hr=mean(avgH),
#                                     srad=sum(solarR),
#                                     rain=sum(totR),
#                                     wind=mean(windS),
#                                     doy=min(doy),
#                                     cb=sum(cb1(avgT, avgH))) %>%
#   mutate(scb=cumsum(cb), wcb=cb1(temp,hr), swcb = cumsum(wcb))
#
#
# ab2015 = getApiWeather("01/04/2015","30/11/2015") %>%
#   group_by(name,date) %>% summarise(temp=mean(avgT),
#                                     hr=mean(avgH),
#                                     srad=sum(solarR),
#                                     rain=sum(totR),
#                                     wind=mean(windS),
#                                     doy=min(doy),
#                                     cb=sum(cb1(avgT, avgH))) %>%
#   mutate(scb=cumsum(cb), wcb=cb1(temp,hr), swcb = cumsum(wcb))
#
#
# require(ggplot2)
# p10<-ggplot(ab2010, aes(x=date,y=scb)) + geom_line()
#
# p11<-ggplot(ab2011, aes(x=date,y=scb)) + geom_line()
# p12<-ggplot(ab2012, aes(x=date,y=scb)) + geom_line()
# p13<-ggplot(ab2013, aes(x=date,y=scb)) + geom_line()
# p14<-ggplot(ab2014, aes(x=date,y=scb)) + geom_line()
# p15<-ggplot(ab2015, aes(x=date,y=scb)) + geom_line()
#
# require(gridExtra)
#
# grid.arrange(p10, p11, p12, p13, p14, p15)
#
#
