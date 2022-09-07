/**
 * 
 */
d3.selectAll('code')
.datum(function(){return this.dataset;})
.style("width", "15%")
.transition().duration(1500)
.style("width",d=>d.val)
