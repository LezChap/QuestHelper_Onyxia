QuestHelper_File["static_esMX_1.lua"] = "1.4.3"
QuestHelper_Loadtime["static_esMX_1.lua"] = GetTime()

if GetLocale() ~= "esMX" then return end
if (UnitFactionGroup("player") == "Alliance" and 1 or 2) ~= 1 then return end

table.insert(QHDB, {
		flightmasters = {
				[6] = "��Ѷ_5��H��E��\000�",
		[7] = "�%|8�x���_ƞ�L9",
		[8] = "�j�=�Ix8a=�o��@",
		[16] = "�8}p�y�%c�(Ð",
		[18] = "*E��!�����s 9",
		[20] = "\\�z�^�y����v��",
		[22] = "��P���hj�\000�	���fg\0009",
		[28] = "_���z�x����i�X�0�",
		[29] = "Ǻ猂�1H\\�u�����|��",
		[31] = "y�����kƬ+��k�Q\000�",
		[32] = "x5�\000k=�G'ޒ7ʄ,�[I)��\r�j@",
		[33] = "\\ɬ�%9�^#i@",
		[34] = "�3^�ŹE\r%���>�6�9",
		[35] = "�h�=�F��j�����\000C�",
		[37] = "��-ҥ��Q�k@",
		[40] = "��z�Qs�\"3�5�\000k=�G'��",
		[43] = "���i@E�{a�	��\\�Ð",
		[44] = "mV(�h*��u�(9",
		[46] = "`�)(�܁ĸ��)cl@",
		[49] = "�H�\\�|K ��\000C�",
		[52] = "�Bİ���I�:֍��Ð",
		[56] = "�b.�+�GFڃ�",
		[59] = "�q.l�H�=�~\000C�",
		[60] = "*D :Pr�����ɞ0@",
		[61] = "BY u�'*�X�0�",
		[63] = "`�)(P��(v�ݣ���>�F@@",
		[65] = "%�-J�_R�p����9",
		[66] = "�%q7Sڃ�",
		[68] = "����$ye�(����",
		[70] = "T�5)�X��K\000C�",
		[72] = "_����op.��r*_�|��",
		[73] = "l���o��?�Ð",
		[76] = "��`-��	�\000i�v[�@",
		[78] = "T�GF^I�}��P/(9",
		[81] = "mB=�j��8��09",
		[82] = "�p!��[�ݙ�\000�",
		[84] = "�_�i�����y�#o@����9",
		[86] = "�g4�E�09",
		[87] = "�¾5��PX��ƞ�L9",
		[91] = "�T�|��y�9",
		[92] = "��s�9��'25�@",
		[95] = "P�o4G;���d\000�",
		[100] = "�H��/�|���c(��)cl@",
		[101] = "��ϑ<v�&��",
		[103] = "y�z��Rʺ��t\000�Iѩ�\000C�",
		[106] = "_���s#bw�3�5�\000k=�G'��",
		[107] = "�g�FYWa�T�T�T��R�@",
		[108] = "��\\@",
		[110] = "%��V�7�۰\r���Ӏ�",
		[111] = "�;����QY�Sl@",
		[112] = "a��aPBm�@",
		[114] = "���0�N�h�cpO�ѐ\000C�",
		[115] = "��ѵ��&������|�e�l@",
		[116] = ":s��\\�>W���)cl@",
		[118] = "%��u��sZ���",
		[119] = ":7w��@",
		[123] = "��z쏓����)�Qh@�+�9",
		[124] = "qo��k&����Y��",
		[125] = "m��`�PQ�k@",
		[127] = "��լB�܈v�y���@g�̍Ҁ�",
		__dictionary = " \"',ABCDEFGHILMNOPRSTUVZabcdefghijklmnopqrstuvwxyz�������",
		__prefix = "name=\"",
		__tokens = "�r0\000������w\000���8��Y��#y23�s�<�)�֋L���pJӀ7Y9H\"bb�0�ÃrTt����B�����S���\000��!���³����dC�\000�Y�FфDA!����ʔ��Rb��DA��&�D��)�x�$�r���bb<5'{�\000�g��n�V��U!G�E�Z�.AHj\
�\000��Py��\"DLd	pT�\000\r��1,�.��W���|�GbFZ�0�e#P 8pZL\"�Cx�n��i0�F���<�\000��3aN��@\"�v�6��`�s4 8�&Z��L��f��0��&�rA݊��2�DA;xq]�0T��� T'F)�*|{)AȐ���l�S!��@U���D�2$�<1x0E!�`:3H\000���e.�D��0s��6R(Ď� X@#��0s,B�Ɂ�P���	�|�l���jQ�q��.+8�ز��� 3Ǘ/�Q�U*����8zY��\
�\000%6���x�B�M;f̦�\"Z��@Fg�L��Iz�F1[\000��c�\000� Z��7mD�-���#��b�Q\"�/D�%�̸��6a�|�%hk\000�p����b�Rb\000�i#�E/O A�;� 5�9F�E��U��+�����CѹQ�x�,��&9^	�$(��W'������'rm�H����A0JL�Hs!册z�0�&��`&��(!�E|J�)Hb�r�[2�@�,r����`b�#Ͳ�6�\000Ae���}�GD�&lP��-�2e�����\"�I�&p)n0BJq��@�b�NKL�~[AU	o)��)���,I����KqM\
��%&�,\000KȦDx|Y��� ��)K#������j�`\"��|D�ɀ-���\rɮ�:�Ĺ�p�yڠD�t�_R�G+�̲)#�7b�#CEt�/`�DK�xMB�ֹ��-J G�g#��D@x�[6s��D� �h`��\\��D��$	�Ǝ����X��c�\rU�B�;ȍ��+�?S1zq��BP�]K�x��G��2���#��άLiR0�;S\r�|��A�JI��c,W�]$+���TW��Z� X��D%�����h�P���v`\000vᤴ��x\000\000)��p\000\r��A\ruV'X�JQ?B0\r��^xL:��)'c��#,B/eET!��%\
H�:�� R�<)���G�A\000.D�%HY�q51mO��rFr4�y}��*���Uk是�u��f E|�jxB�jq��$�q�/FA���`?���&\000�AECh��G2^\000+�@q�:\000��:��c7�b��;%%fО��L���lS�B80�{O%�0!�^J��E琯�r�d͠fS��'1�Dc�_�%}��J�d�D�p���1\r��Ll�|H�ZxJ/�y�B��A�}�4eYp���jf���T� r�S��&s�/�`.���I�� E��	�;�������<��%+��_U���#���qɜ�p@����Lఽ�p @@$�ɪ\\Ov��e3>u0T�S\000�gq����H�\000r�S����\r� %�Q\0000\000�`�h�\"�J�bK�\000�\r�`���`6m\000�ad��`�\000	=��/G��҇����>�����!#&���$�CGX9��н�D04�x\"hu�)��yl\r�o�Fl)�R���6�0�d�Lu����S�Y/\000b\\4!܆\000C}�a0V��Z����l\000��"
	}
}
)
