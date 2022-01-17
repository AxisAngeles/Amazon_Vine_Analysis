# Amazon_Vine_Analysis

### **Purpose**
The following document contains the general results from the analysis made for _Amazon reviews_ written by members of the paid Amazon Vine program. The chosen dataset was that of Video Games and gather more than 1M registers, which were later cleaned and analyzed to determine any patterns.

#

### **Results**
Overall, after a cleaning process, aproximately 40K video game reviews were considered with the following results:

**Video Game vine summary**<br>
![vine_table](https://github.com/AxisAngeles/Amazon_Vine_Analysis/blob/main/Resources/vine_table.PNG)
<br> Less than 1% of the reviews came from the paid program with only a 39% of five-star evaluations.

* 94 Vine reviews and 40,471 non-Vine reviews.
* 5 stars: Vine 48 | Non-Vine 15,663
* 5 stars: 51% | Non-Vine 39%

#

### **Summary**
Based on the above results, there's evidence of a slight bias towards possitive reviews, given the +10% increase in five-stars percentages.

We then recommend an additional **t-testing analysis (Two Sample)** to confirm if there's any statistical difference between both kind of reviews.