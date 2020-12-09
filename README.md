# stochastic_simulations

## Table of contents
* [About](#about)
* [Examples](#examples)
  * [insurance_claims](#insurance_claims)
* [Relevence](#Relevence)
  * [insurance_claims](#insurance_claims)

## About
The simulation of stochastic processes may be a powerful tool for all businesses. I attempt to demonstrate this by
providing different examples, in the form of various programs. Techniques included are: generation of discrete and
continuous random variables.In addition, under the section Relevence I try to formally explain how the given example 
may be useful to a business. 

## Examples

### insurance_claims

In the file insurance_claims.R I simulate the probability that an insurance company does not go under in 
the next 365 days. There are four parameters to this simulation. First, claims are made according
to a poisson process. Second, the amount of each individual claim is a random variable with exponential distribution. 
Finally, the company recieves payments continuously in time at a constant rate and the company starts with an initial 
capital of $25,000. After running the file: 

[![Screenshot-from-2020-12-09-11-41-30.png](https://i.postimg.cc/qBjhd9mV/Screenshot-from-2020-12-09-11-41-30.png)](https://postimg.cc/rzRF1YXQ)

We find after running 100 simulations that there is a probability of 0.9, that the insurance company will not go under at any point in the next 365 days. 
Click [insurance_claims](#insurance_claims) to learn how this may be relevent for your business. 

## Relevence
Under this section my goal is to show how the simulation at hand may be useful to a business. I try to answer questions like 
why is this valuable to a business? How can this be an asset to a business? and which specific businesses may benefit from this? 

### insurance_claims

**Which businesses may benefit from this?** All business <br/>

While insurance_claims.R calculates the probability of going under for an insurance company, the programs modeling process 
may be similar for all businesses. For example, instead of claims we could be using any other sort of liability or expense. 
Similarly payment amounts can also be modeled using random variables, as can moments of payments(when the payments are made). 
While I simulate a probability, it's possible to simulate other required values. For example, it is possible to calculate 
the revenue required to maintain the company from going under, or given x parameters how much capital should
a certain company start with to minimize probability of going under.
