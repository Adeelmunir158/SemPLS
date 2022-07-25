library(semPLS)

attach(mm)
m=as.matrix(mm)
attach(sm)
s=as.matrix(sm)
attach(data)
d=data.frame(data)

model= plsm(data = d, 
            strucmod = s, 
            measuremod = m)

z = sempls(model, 
           data = d, 
           wscheme = "pathWeighting")


#Output:
#--------------------------------------
#Coefficients
print(z$coefficients,digits = 3)
print(z$path_coefficients, digits = 3)

#Outer Loading
print(z$outer_loadings, digits = 3)

#Composite Reliability
print(dgrho(z),digits=3)
#AVE
print(communality(z),digits=3)


#Cross Loading
print(z$cross_loadings, digits = 3)

#Total Effects
print(z$total_effects, digits = 3)


#R-Square
print(rSquared(z),digits=3)
#Adjusted R-Square
print(rSquared2(z),digits=3)

#Inner Weight
print(z$inner_weights, digits = 3)

#Outer Weight
print(z$outer_weights, digits = 3)

#Factor Score
print(z$factor_scores, digits = 3)


#-------------------------------------
set.seed(12345)

b=bootsempls(z, 
           nboot = 500, 
           start = "ones", 
           verbose = FALSE)

summary(b)
#=====================================