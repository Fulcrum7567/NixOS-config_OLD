#!/bin/sh


# -- Examples: -- #
#
# createNewProfile private/home
# -> creates a new profile in profile type private with the name home
# -> uses private/global as reference
#
# createNewProfile private/gaming --reference home
# -> creates a new profile in profile type private with the name gaming
# -> uses private/home as reference
#
# createNewProfile private/chill --copyFrom gaming
# -> creates a new profile in profile type private with the name chill
# -> copies profile private/gaming, uses same references


