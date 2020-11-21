# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: arannara <arannara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/20 22:04:06 by arannara          #+#    #+#              #
#    Updated: 2020/11/20 18:15:22 by arannara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN 	apk update && \
		apk add openrc

RUN		apk add influxdb

EXPOSE  8086

CMD     [ "influxd" ]