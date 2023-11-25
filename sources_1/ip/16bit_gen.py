import random

weight_1 = open("weight_bram_1.coe", "w")
weight_2 = open("weight_bram_2.coe", "w")
weight_3 = open("weight_bram_3.coe", "w")
weight_4 = open("weight_bram_4.coe", "w")
feature_1 = open("feature_bram_1.coe", "w")
feature_2 = open("feature_bram_2.coe", "w")
feature_3 = open("feature_bram_3.coe", "w")
feature_4 = open("feature_bram_4.coe", "w")

weight_1_txt = open("weight_bram_1.txt", "w")
weight_2_txt = open("weight_bram_2.txt", "w")
weight_3_txt = open("weight_bram_3.txt", "w")
weight_4_txt = open("weight_bram_4.txt", "w")
feature_1_txt = open("feature_bram_1.txt", "w")
feature_2_txt = open("feature_bram_2.txt", "w")
feature_3_txt = open("feature_bram_3.txt", "w")
feature_4_txt = open("feature_bram_4.txt", "w")

file_list     = [weight_1, weight_2, weight_3, weight_4,feature_1, feature_2, feature_3,feature_4]
file_list_txt = [weight_1_txt, weight_2_txt, weight_3_txt, weight_4_txt,feature_1_txt, feature_2_txt, feature_3_txt,feature_4_txt]

for file_index, file in enumerate(file_list):
    file.writelines("memory_initialization_radix=16;\n")
    file.writelines("memory_initialization_vector=\n")
    for i in range(0,8192):
        gen_temp=""
        for loop in range (0,2):
            loop_temp=""
            for j in range (0,2):
                temp = random.randrange(0,15,1)
                if (temp==10)  : temp ="A"
                elif (temp==11): temp ="B"
                elif (temp==12): temp ="C"
                elif (temp==13): temp ="D"
                elif (temp==14): temp ="E"
                elif (temp==15): temp ="F"
                loop_temp = f"{loop_temp}{temp}"
            gen_temp = f"{gen_temp}00{loop_temp}"
        if (i!=8191):
            file.writelines(f"{gen_temp},\n")
            file_list_txt[file_index].writelines(f"{gen_temp},\n")
        else :
            file.writelines(f"{gen_temp};\n")
            file_list_txt[file_index].writelines(f"{gen_temp};\n")
    file.close()
    print(f"end of file")
