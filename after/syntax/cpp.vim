" Since Google Mock / Test macros aren't in the standard C++ syntax,
" highlight them here
highlight GoogleSyntax ctermfg=99
syn keyword GoogleTestMock TEST_F EXPECT_EQ ASSERT_EQ EXPECT_DEATH ASSERT_DEATH ASSERT_TRUE EXPECT_TRUE ASSERT_FALSE EXPECT_FALSE EXPECT_NE ASSERT_NE EXPECT_LT ASSERT_LT ASSERT_LE EXPECT_LE ASSERT_GT EXPECT_GT EXPECT_GE ASSERT_GE EXPECT_STREQ ASSERT_STREQ ASSERT_STRNE EXPECT_STRNE ASSERT_STRCASEEQ EXPECT_STRCASEEQ EXPECT_STRCASENE ASSERT_STRCASENE SUCCEED FAIL ADD_FAILURE ADD_FAILURE_AT EXPECT_THROW ASSERT_THROW EXPECT_ANY_THROW ASSERT_ANY_THROW ASSERT_NO_THROW EXPECT_NO_THROW ASSERT_PRED1 ASSERT_PRED2 ASSERT_PRED3 ASSERT_PRED4 ASSERT_PRED5 ASSERT_PRED6 ASSERT_PRED7 ASSERT_PRED8 ASSERT_PRED9 EXPECT_PRED1 EXPECT_PRED2 EXPECT_PRED3 EXPECT_PRED4 EXPECT_PRED5 EXPECT_PRED6 EXPECT_PRED7 EXPECT_PRED8 EXPECT_PRED9 EXPECT_PRED_FORMAT1 EXPECT_PRED_FORMAT2 EXPECT_PRED_FORMAT3 EXPECT_PRED_FORMAT4 EXPECT_PRED_FORMAT5 EXPECT_PRED_FORMAT6 EXPECT_PRED_FORMAT7 EXPECT_PRED_FORMAT8 EXPECT_PRED_FORMAT9 ASSERT_PRED_FORMAT1 ASSERT_PRED_FORMAT2 ASSERT_PRED_FORMAT3 ASSERT_PRED_FORMAT4 ASSERT_PRED_FORMAT5 ASSERT_PRED_FORMAT6 ASSERT_PRED_FORMAT7 ASSERT_PRED_FORMAT8 ASSERT_PRED_FORMAT9 EXPECT_FLOAT_EQ ASSERT_FLOAT_EQ EXPECT_DOUBLE_EQ ASSERT_DOUBLE_EQ ASSERT_NEAR EXPECT_NEAR ASSERT_DEATH_IF_SUPPORTED EXPECT_DEATH_IF_SUPPORTED EXPECT_EXIT ASSERT_EXIT EXPECT_NO_FATAL_FAILURE ASSERT_NO_FATAL_FAILURE EXPECT_FATAL_FAILURE EXPECT_NONFATAL_FAILURE EXPECT_FATAL_FAILURE_ON_ALL_THREADS EXPECT_NONFATAL_FAILURE_ON_ALL_THREADS GTEST_FLAG GTEST_CATCH_EXCEPTIONS GTEST_BREAK_ON_FAILURE GTEST_TOTAL_SHARDS GTEST_SHARD_INDEX GTEST_SHARD_STATUS_FILE TYPED_TEST_CASE TYPED_TEST REGISTER_TYPED_TEST_CASE_P INSTANTIATE_TEST_CASE_P SCOPED_TRACE FRIEND_TEST RUN_ALL_TESTS MOCK_METHOD0 MOCK_METHOD1 MOCK_METHOD2 MOCK_METHOD3 MOCK_METHOD4 MOCK_METHOD5 MOCK_METHOD6 MOCK_METHOD7 MOCK_METHOD8 MOCK_METHOD9 MOCK_CONST_METHOD0 MOCK_CONST_METHOD1 MOCK_CONST_METHOD2 MOCK_CONST_METHOD3 MOCK_CONST_METHOD4 MOCK_CONST_METHOD5 MOCK_CONST_METHOD6 MOCK_CONST_METHOD7 MOCK_CONST_METHOD8 MOCK_CONST_METHOD9 ON_CALL EXPECT_CALL EXPECT_THAT ASSERT_THAT MATCHER
hi def link GoogleTestMock GoogleSyntax

" Include new C++11 keywords etc. until vim includes it as standard.
syn keyword cConstant nullptr
syn keyword cStorageClass constexpr
" Include the doxygen tparam keyword, which the vim syntax misses.
syn keyword doxygenParam tparam
" Highlight extra 'keywords' for C++ interface programming
syn keyword cppAccess implements
syn keyword cppStructure Interface

highlight ArgumentColor ctermfg=179
syn match ArgumentMatch '\<_[a-z0-9_]*\>'
hi def link ArgumentMatch ArgumentColor

highlight MemberColor ctermfg=158
syn match MemberMatch '\<[a-z0-9_]*__\>'
hi def link MemberMatch MemberColor

hi def Normal ctermfg=255
hi def doxygenComment ctermfg=243 guifg=DarkRed
hi def doxygenBrief cterm=bold ctermfg=243 guifg=DarkBlue gui=bold
hi def doxygenBody ctermfg=DarkBlue guifg=DarkBlue
hi def doxygenSpecialTypeOnelineDesc cterm=bold ctermfg=88 guifg=firebrick3 gui=bold
hi def doxygenBOther cterm=bold ctermfg=24 guifg=#aa50aa gui=bold
hi def doxygenParam ctermfg=247 guifg=#aa50aa
hi def doxygenParamName ctermfg=95 guifg=DeepSkyBlue4 gui=italic,bold
hi def doxygenParamDirection ctermfg=100
hi def doxygenSpecialOnelineDesc cterm=bold ctermfg=243 guifg=DodgerBlue3 gui=bold
hi def doxygenSpecialHeading cterm=bold ctermfg=DarkBlue guifg=DeepSkyBlue4 gui=bold
hi def doxygenPrev ctermfg=DarkGreen guifg=DarkGreen