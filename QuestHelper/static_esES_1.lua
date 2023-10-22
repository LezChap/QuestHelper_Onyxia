QuestHelper_File["static_esES_1.lua"] = "1.4.3"
QuestHelper_Loadtime["static_esES_1.lua"] = GetTime()

if GetLocale() ~= "esES" then return end
if (UnitFactionGroup("player") == "Alliance" and 1 or 2) ~= 1 then return end

table.insert(QHDB, {
		flightmasters = {
		"\
c�E+�\000", "�0���BQ\"��V\000", "�������p�]P\
�QL�\000", "l£����z8����", "�8}�\000", "�ܬT�S�hӑ�-0�9�B\000", "�:\\��t(҅v��5\000", "3sj�CL�Q���Z� \000",
		[11] = "�A�B�NAtf\000",
		[12] = "%y�ɪ�A��Q�\000�\000",
		[13] = "G(�9�Y	��\000!\000",
		[14] = "M6ߩ��3X\000",
		[15] = "�1��u��S(\000",
		[16] = "���7�<U�\000",
		[17] = "e�k���\\+7�� �",
		[18] = "e��G�fU2mW(i6\000",
		[19] = "\r�ZM�����ÚO.F`�",
		[20] = "�Y<���f��o\000",
		[21] = "/�1�LC��̡\000",
		[22] = "fX�˝�ʦ��(�ש\000",
		[23] = "�Y�Ჹ�,�Rh0�W�v\000B\000",
		[24] = "W/��7��^��p�U\000B\000",
		[25] = "�p����:\
{\000!\000",
		[26] = "��Z��hBՀT�f��",
		[27] = "g���V+b6O9� \000",
		[28] = "\
c��~8�T�*�\000�\000",
		[29] = "����Vgp/a�\\Īe�@",
		[30] = "W/�ɓ��eZ��sf\000�",
		[31] = "�f#K�i)&�G�C�\000",
		[32] = "���B����+Ǒ�,+���>�w,\000�\000",
		[33] = "��7���7j^�\000",
		[34] = "���ж�ṦQ .%�y�x�0@",
		[35] = "C�m�\
5T�� \000",
		[36] = "�n6��H�얔�,\000�\000",
		[37] = "���]V�c0@",
		[38] = "I\
}��\
�P�l\000",
		[39] = "4<�X�m�ƶ\000",
		[40] = "ۄ}݀S�����:r��u�\\�\000",
		[41] = "��Mai)&�G�C�\000",
		[42] = "�غE���h��\000",
		[43] = "t�X\"}��jy�1$G�B\000",
		[44] = "v]}6@^�ָ)�T&�\000�",
		[45] = "/���ɔǵ=kE������d�\000",
		[46] = "\r)�s�:z֌�({�\000 \000",
		[47] = "�B�*<aCt�\"�Қ����",
		[48] = "��>�V�[]a\000!\000",
		[49] = ".)Q3e-\000@",
		[50] = "Ԧ;5w�8�l�\000",
		[51] = "����PL��&���&e�B\000",
		[52] = "WɨV\r<��c� ��\000",
		[53] = "o�|\000B\000",
		[54] = "J�c�z��\"t�\000�",
		[55] = "\
l�7Ʌ#���P\
�QL�\000",
		[56] = "4\r�+��x���\000",
		[57] = "5,��e&	n�h��T�d�MNsx@",
		[58] = "\
Z�W3���V��\000",
		[59] = "�>���s�\000",
		[60] = "e�Lݛh������YFH��",
		[61] = "r<��0R��\000!\000",
		[63] = "\r)�s�	����-0�9�B\000",
		[64] = "s�_v@��̡\000",
		[65] = "	��x]�Ψ��~L�2�\000",
		[67] = "\r�Zg�*đ������S�\000",
		[68] = "�\rE\"2�%�e\000",
		[69] = "B�Br��:�8 \000",
		[70] = "\"�!�%;\"�\000",
		[71] = "���b�Ct�\"�Қ����",
		[72] = "\
c��Vv>\00062Z��a�f\000�",
		[73] = "\r���9��mP�f� \000",
		[74] = "��$�\000�3���C�\000",
		[75] = "@��%�U0	ҕD\000�\000",
		[76] = "W[Fc�r�I��R��\000",
		[77] = "\r��rg�p�K� ��3\000",
		[78] = "8u�\rL�Q���\000",
		[79] = "*\"i��5D�x@",
		[80] = "�o�4@@",
		[81] = "`���@'�+��\000 \000",
		[82] = "��_�����cm� \000",
		[83] = "�{*0��%�nc[_�\000",
		[84] = "hn���^*LtX���<0��d&�\000�\000",
		[86] = "���S�3[X\000",
		[87] = "���,��HT��95z5\000",
		[89] = "	��Z�mNT�� \000",
		[90] = "/�m	�p���V�N���\000",
		[91] = "z&-C�nw6`\000",
		[92] = "�|�5�1����xX\000�\000",
		[93] = "X�U�����\\�pC2�\000",
		[94] = "\
c�d?��6����\000",
		[95] = "9_5rV>��̡\000",
		[96] = "�U�ںcG�qnjy�1$G�B\000",
		[97] = "�9}�B��f:R���",
		[99] = "\r)�s�@�����MM�Ur��`@",
		[100] = "�1��ɔ�2�QXT�=	?�0@",
		[102] = "\r���Ws]$�mW(i6\000",
		[103] = "/�m����Qs��#$\000",
		[104] = "	��F�W�I\"�[�V�F`�",
		[105] = "/���%\\��,f\000",
		[106] = "\
m�AԲ��������C�W \000",
		[107] = "��������&t�@�",
		[108] = "���\000�",
		[109] = "`�a\"����.f\000",
		[110] = "	����Ǜ���B+�_���",
		[111] = "�oZ���\r�A\000",
		[112] = "\r\000z��;�@@",
		[113] = "��Q��w��%���kЀ",
		[114] = "�Me\"5��g�L\"��{�P�",
		[115] = "���۵F���T����\000\000",
		[116] = "%|�ݫΨ����y� \000",
		[117] = "�5��v�\
����2 \000",
		[118] = "	��S��=6�k\000!\000",
		[119] = "�k$\000�",
		[120] = "�@TUR��Q���\000",
		[121] = "��7�y<�)t��F`�",
		[122] = "C�4V��z,��\000!\000",
		[123] = "ۄ���M�r3ŦCG=�(@",
		[124] = "�ͅDd�_�չ�ـ \000",
		[125] = "r��=%��\000",
		[127] = "�1z�	q;3*N��+{ �\000",
		[128] = "\r�YL�����=k���Bl�\000",
		[129] = "5\
!��4A0	ҕD\000�\000",
		__dictionary = " \"',235:=ABCDEFGHIKLMNOPRSTUVZabcdefghijklmnopqrstuvwxyz��������",
		__tokens = "��B lD@A	�H�$M>�Ze�\"`�e�wd\rR\000�촴j�8H���E�^h3=��1=)��ä0?�A��Ƥ�6�7�����N���I���6���I)��U)�L���L\r��>c]�ag��T倆�i�Z���H�$%gk���	�\000_�a�ti�X����Leq\000�@K��2LMp�	���FF�%�����ȃ\\;k�c��|4&?ЮȤq�'�oV�i\"�Q�E���%�'�@H�X+0�Ȫ�d�w=��`0Pʛ��q��f��\000*	��l~>�%`�,ʩ�� \"�f{:(S)��d)N��iC�@\000Eo�\000�*�\000⁉�\000R\000ض�p(�&�]��laikY�u<�B�Y����(D�?cg\000\000v{l1�$�rAot�����N��?Yl�;�)�(X�8���1��������C�\\�(:��l��7W��-��c!�lR&!�C�-�M3X'�	\"fը�\"T9\
�z�?z�\
��J�0(�P\\��T���E��-@�Dr�A\
��A�ִQT\r����K�\000��j��\"���F+�5�2��)A\
-� ���`�j?f���z�\
3	@����;K�\000��zR�'�L�P�4P��ղ�1�閰�*H�h�*p�.�f(*�Kka <�O�\000�1Nh�\\�2�U:B!�V#�r�ʱ��§�ض���NEd�@C�]l���3�I�y\0000��\\+,�?7��;!A���8T&룦�*s��;�%n��R�D��l` ������X����Kn�+��*�,݋s,(FP�JM�`���x_O&rh`X!xX�@�@��[����SZ!�iL���#��e!|f`�6K���浜!�v*�蕼�P�r3.�������:��m\000�tu�����@0kS>ցf-�8���{2�l�b���ef�����(�ZID��\000/�=Z[x@V��E��l���2���5��1=54H������ZڴΣE�[��&xMcܯp3�g-C7����.�?�`b�J�ĵ�4e��S����T������R�I\\�O�jn��f�E�`'smN�8DdiA��KM��4��`k\r���l��e� �j��pg�`1����F\
lͤ�\"+!!�0�Lu�`���+f8���񬁈�)*jT(,Wx�P�����\
����j��.��R��I�3Ǆk)�P�Ai\
R(AI�Ը{X$#��zPL��K�����$L�^.��>��������V��P��2�A\000]%��\"&�уV��8 \000�c�\000HfTj��,�I�O�՜ե\000�'��(FL���e�H��(�0��э��R�+�[�-@f ��3A �F=�\
�x\"�z<W%f��N�BD�Z��ϻ\000J��2�����n�PYW�xE�����T�UM��1?�H�J}��RԤR!���'=Hf��8@\000��a����8\000A�{(fف���`ƱZGE1���HS=�D�Ϫ�`9A��V���\000DG�lD�i*�ж!)��IM%5���(�'uҫ����]�`�Th�\rM0�-ް$��5RU��c��P3$�E}�P`�ԗ�k�;�q����PԜh�0&kхB\"��T�{`���~Җ	r��Ew.9�>\"}c�@��vY�	U�������\"J�Ԏ\
w��V�%j�TLPҖ)Yt?���\000QO�}c(�5N�@]m*�ͳv�>*��\000(�E���6f�n���T#��nţ�\000���̐@�BN�lS,֭$���u+��!R��T\\&k8��x[+���-�5�U�\"�#��3>������|�S��s��Wx�	�Q2�\000�b�3��,\rXNux���&b(Z�g)�1��\000�^��ܨq\000�c�Ɖ��/��=�ں\000gj�8�����w{�bM�F	���\000��r��8l�zS���Y��n�e(�SFH� ���\r�;����>Ƈ)!��Zd�\"��$<K�NX�UR�a�N&���Z�R�8��)G��W��sS�p��%U2�gNK���P�z CD`e@Z���a�cQ��cB9@�,J��!�a\"�-mi�((P}(��0�Y��M3�;&i���&��Ȱw?f��q#��V'���[㫿��.+�U��b�D(\"�G}bHQFF\rf������'P�rR���+&{�^8x�07�@s�]���)��R[O���E�A�����\000\\Gغ:E����R��7�=��~���'9�e�]�Tj��Z���L�[�D0�F��/f��T���x^����3\000��\
�(O����6��@X9����˂�'�SW(B+D�`��[�Jt!32�����޺rz|�z.F��k+?�Z��j���jD���6�B��g'bAO�XZ��V�\"7�ڧIP�!���yG'`�,�\000T�;��@�pP\
�}Nɥ�0�2].O�!�2���bP���p���a��c30�Ç(�7�2���\
�� p��W�Ѳ������;x��9�؈����Z9q �������Ѣi�P2��'�Z9��(k'\r�n�JL��ցQh\\��y��λ�M�*~���;����K�&�b��P��Ag:��,@��c��(���#��l��u7���&*��Z_5�����,`(P-�;�������a��A�W�W�����P�b���a�IS܋�Z#����������)Z@�=+t�P32�(؏�-�ؙ����n��\
P���ȑ	�	��TȎ5*@;�\000� ��)J)�Q�\000xe�H�s�R��ꕠ\000\0000-�)��\0000)Ky��-��M���;�\000H0���p�T:;h�\000�#3B��(\000!�\000�8���T��`8HeE+9�>�Z�Y`��>�V���o\000lj�P����&Z\r(�@5yۂ����x?�\000��-��Z��Z��#��7��69q#,-����!1q\000����ڂ��k���N�\r���xk\000��(k5������"
	}
}
)
