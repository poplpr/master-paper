%%
%% This is file `bithesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% bithesis.dtx  (with options: `cls,thesis')
%% 
%%     Copyright (C) 2025
%%     Association of Bit Network Pioneer and any individual authors listed in the documentation.
%% ------------------------------------------------------------------------------
%% 
%%     This work may be distributed and/or modified under the
%%     conditions of the LaTeX Project Public License, either
%%     version 1.3c of this license or (at your option) any later
%%     version. This version of this license is in
%%        https://www.latex-project.org/lppl/lppl-1-3c.txt
%%     and the latest version of this license is in
%%        https://www.latex-project.org/lppl.txt
%%     and version 1.3 or later is part of all distributions of
%%     LaTeX version 2020/11/27 or later.
%% 
%%     This work has the LPPL maintenance status `maintained'.
%% 
%%     The Current Maintainer of this work is Feng Kaiyu.
%% ------------------------------------------------------------------------------
%% 
\RequirePackage{expl3,l3keys2e}
\ProvidesExplClass{bithesis}
{2025-04-08}{3.8.3}{BIT Thesis Templates}
\int_new:N \g__bithesis_thesis_type_int
\int_new:N \g__bithesis_head_zihao_int
\bool_new:N \g__bithesis_twoside_bool
\bool_new:N \g__bithesis_thesis_type_english_bool
\bool_new:N \g__bithesis_blind_mode_bool
\bool_new:N \g__bithesis_quirks_mode_bool
\tl_new:N \g__bithesis_label_divide_char_tl
\seq_new:N \l__bithesis_right_seq
\seq_new:N \l__bithesis_left_seq
\cs_new:Npn \__bithesis_hide:n #1 {
  \g__bithesis_const_substitute_symbol_tl
}

\cs_new:Npn \__bithesis_secret_info:nn #1 #2 {
  \bool_if:nTF \g__bithesis_blind_mode_bool {
    #2
  } {
    #1
  }
}

\cs_new:Npn \__bithesis_secret_info:N #1 {
  \__bithesis_secret_info:nn {#1} {\tl_map_function:NN #1 \__bithesis_hide:n }
}
\cs_new:Npn \__bithesis_secret_info:n #1 {
  \__bithesis_secret_info:nn {#1} {\tl_map_function:NN {#1} \__bithesis_hide:n }
}
\cs_new:Npn \__bithesis_get_const:N #1 {
  \__bithesis_if_thesis_english:TF {
    \use:c {c__bithesis_label_ #1 _en_tl}
  } {
    \use:c {c__bithesis_label_ #1 _tl}
  }
}
\cs_new:Npn \__bithesis_set_english_mode: {
  \bool_gset_true:N \g__bithesis_thesis_type_english_bool
}
\cs_generate_variant:Nn \tl_if_empty:nTF {x}
\cs_generate_variant:Nn \seq_set_split:Nnn {Nnx}
\cs_new:Npn \__bithesis_same_page: {
  \let\clearpage\relax
  \let\cleardoublepage\relax
}
\cs_new:Npn \__bithesis_if_graduate:TF #1#2 {
    \int_compare:nNnTF {3} < {\g__bithesis_thesis_type_int}
      {#1}
      {#2}
  }
\cs_new:Npn \__bithesis_if_graduate:T #1 {\__bithesis_if_graduate:TF {#1} {}}

\cs_new:Npn \__bithesis_if_thesis_int_type:nTF #1#2#3 {\int_compare:nNnTF {\g__bithesis_thesis_type_int} = {#1} {#2} {#3}}
\cs_new:Npn \__bithesis_if_thesis_int_type:nT #1#2 {\__bithesis_if_thesis_int_type:nTF {#1} {#2} {}}
\cs_new:Npn \__bithesis_if_thesis_int_type:nF #1#2 {\__bithesis_if_thesis_int_type:nTF {#1} {} {#2}}

\cs_new:Npn \__bithesis_if_thesis_english:TF #1#2 {\bool_if:nTF {\g__bithesis_thesis_type_english_bool} {#1} {#2}}
\cs_new:Npn \__bithesis_if_thesis_english:T #1 {\__bithesis_if_thesis_english:TF {#1}{}}
\cs_new:Npn \__bithesis_if_bachelor_thesis:TF #1#2 {\int_compare:nNnTF {\g__bithesis_thesis_type_int} < {4} {#1} {#2}}
\cs_new:Npn \__bithesis_if_bachelor_thesis:T #1 {\__bithesis_if_bachelor_thesis:TF {#1} {}}
\cs_new:Npn \__bithesis_if_master_thesis:TF #1#2 {\int_compare:nNnTF {\g__bithesis_thesis_type_int} = {4} {#1} {#2}}
\cs_new:Npn \__bithesis_if_doctor_thesis:TF #1#2 {\int_compare:nNnTF {\g__bithesis_thesis_type_int} = {5} {#1} {#2}}
\clist_const:Nn \c__bithesis_thesis_type_clist
    { bachelor, bachelor_translation, bachelor_english, master, doctor}
\clist_const:Nn \c__bithesis_publication_modes_clist
    { biblatex, custom }
\cs_new_protected:Npn \__bithesis_define_label:nn #1#2
  { \tl_const:cn { c__bithesis_label_ #1 _tl } {#2} }

\cs_new_protected:Npn \__bithesis_define_label_by_thesis_type:nnn #1#2#3
  {
    \tl_const:cn { c__bithesis_ #1 _label_ #2 _tl } {#3}
  }

\cs_new_protected:Npn \__bithesis_define_label:nnn #1#2#3
  {
    \tl_const:cn { c__bithesis_label_ #1    _tl } {#2}
    \tl_const:cn { c__bithesis_label_ #1 _en_tl } {#3}
  }

\cs_new_protected:Npn \__bithesis_define_label_by_thesis_type:nnnn #1#2#3#4
  {
    \tl_const:cn { c__bithesis_ #1 _label_ #2 _tl } {#3}
    \tl_const:cn { c__bithesis_ #1 _label_ #2 _en_tl } {#4}
  }
\cs_new:Npn \smallgap: {
  \hspace{0.45ex}
}
\cs_new:Npn \boxempty:
{
  \makebox[1em][l]
  {
    % 为保证与打了勾的一致，也需套盒子
    \makebox[0pt][l]
    {
      % 默认比基线略高，向下降降
      \raisebox{-1pt}{$\square$}
    }
  }
}
\cs_new:Npn \boxcheck:
{
  \makebox[1em][l]
  {
    \makebox[0pt][l]
    {
      % 默认比基线略高，向下降降
      \raisebox{-1pt}{$\square$}
    }
    $\checkmark$
  }
}
\cs_new:Npn \label_space: {
  \__bithesis_if_bachelor_thesis:T {
    \quad
  }
}
\clist_map_inline:nn
  {
    {code} {代码},
    {udc} {UDC分类号：},
    {classification} {中图分类号：},
    {classified_level} {密级},
    {type} {种类},
    {special_type} {学生类型},
    {engineering_special_plan} {工程硕博士专项},
    {cross_research} {交叉研究方向},
    {international_student_ugp} {政府项目留学生},
  }
  {\__bithesis_define_label:nn #1}
\clist_map_inline:nn
  {
    {originality} {原创性声明},
    {originality_clause} {本人郑重声明：所呈交的毕业设计（论文），
    是本人在指导老师的指导下独立进行研究所取得的成果。除文中已经注明引用的内容外，
    本文不包含任何其他个人或集体已经发表或撰写过的研究成果。
    对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。\par~特此申明。},
    {authorization} {关于使用授权的声明},
    {authorization_clause} {本人完全了解北京理工大学有关保管、使用毕业设计（论文）的规定，
    其中包括：\circled{1}~学校有权保管、并向有关部门送交本毕业设计（论文）的原件与复印件；
    \circled{2}~学校可以采用影印、缩印或其它复制手段复制并保存本毕业设计（论文）；
    \circled{3}~学校可允许本毕业设计（论文）被查阅或借阅；\circled{4}~学校可以学术交流为目的，
    复制赠送和交换本毕业设计（论文）；\circled{5}~学校可以公布本毕业设计（论文）的全部或部分内容。},
    {originality_author_signature}
      {本人签名：\hspace{40mm}日\hspace{2.5mm}期：\hspace{13mm}年\hspace{8mm}月\hspace{8mm}日},
    {originality_supervisor_signature}
      {指导老师签名：\hspace{40mm}日\hspace{2.5mm}期：\hspace{13mm}年\hspace{8mm}月\hspace{8mm}日},
  } {\__bithesis_define_label_by_thesis_type:nnn {bachelor} #1}
\clist_map_inline:nn
  {
    {originality} {原创性声明~Statement~of~Originality},
    {originality_clause} {
        本人郑重声明：所呈交的毕业设计（论文），
        是本人在指导老师的指导下独立进行研究所取得的成果。除文中已经注明引用的内容外，
        本文不包含任何其他个人或集体已经发表或撰写过的研究成果。
        对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。特此申明。\par
        \arialfamily I,\dunderline[-1pt]{1pt}{\makebox[18mm]{}},~solemnly~
        declare:~the~submitted~graduation~design~(thesis),~
        is~the~research~achievement~completed~independently~by~myself~
        under~the~guidance~of~the~supervisor.~This~article~does~not~contain~
        any~research~published~or~written~by~any~other~individual~or~group,~
        except~as~already~referenced~in~this~paper.~Individuals~and~groups~
        that~have~made~important~contributions~to~the~study~of~this~paper~
        are~clearly~indicated~and~cited~in~the~paper.\par
    },
    {authorization} {关于使用授权的声明~State~of~Use~Authorization},
    {authorization_clause} {
      本人完全了解北京理工大学有关保管、使用毕业设计（论文）的规定，
      其中包括：\circled{1}学校有权保管、并向有关部门送交本毕业设计（论文）的原件与复印件；
      \circled{2}学校可以采用影印、缩印或其它复制手段复制并保存本毕业设计（论文）；
      \circled{3}学校可允许本毕业设计（论文）被查阅或借阅；
      \circled{4}学校可以学术交流为目的,复制赠送和交换本毕业设计（论文）；
      \circled{5}学校可以公布本毕业设计（论文）的全部或部分内容。\par
      I~fully~understand~the~regulations~on~the~storage,~
      use~of~graduation~design~(thesis)~in~Beijing~Institute~of~Technology.~
      Beijing~Institute~of~Technology~has~the~right~to~(1)~keep,~
      and~to~the~relevant~departments~to~send~the~original~or~copy~
      of~this~graduation~design~(thesis);~(2)~copy~and~preserve~this~
      graduation~design~(thesis)~by~photocopying,~miniature~or~other~
      means~of~reproduction;~(3)~allow~this~graduation~design~(thesis)~
      to~be~read~or~borrowed;~(4)~for~the~purpose~of~academic~exchange,~
      copy,~give~and~exchange~this~graduation~design~(thesis);~(5)~
      publish~all~or~part~of~the~contents~of~this~graduation~design~(thesis).~
    },
  } {\__bithesis_define_label_by_thesis_type:nnn {bachelor_english} #1}
\clist_map_inline:nn
  {
    {originality} {研究成果声明},
    {originality_clause} {本人郑重声明：所提交的学位论文是我本人在指导教师的指导下独立完成的研究成果。文中所撰写内容符合以下学术规范（请勾选）：
\par \boxcheck:\hspace{0.5em} 论文综述遵循“适当引用”的规范，全部引用的内容不超过50\%。
\par \boxcheck:\hspace{0.5em} 论文中的研究数据及结果不存在篡改、剽窃、抄袭、伪造等学术不端行为，并愿意承担因学术不端行为所带来的一切后果和法律责任。
\par \boxcheck:\hspace{0.5em} 文中依法引用他人的成果，均已做出明确标注或得到许可。
\par \boxcheck:\hspace{0.5em} 论文内容未包含法律意义上已属于他人的任何形式的研究成果，也不包含本人已用于其他学位申请的论文或成果。
\par \boxcheck:\hspace{0.5em} 与本人一同工作的合作者对此研究工作所做的任何贡献均已在学位论文中作了明确的说明并表示了谢意。
\par~特此声明。},
    {authorization} {关于学位论文使用权的说明},
    {authorization_clause} {本人完全了解北京理工大学有关保管、使用学位论文的规定，其中包括：
\par~\circled{1}~学校有权保管、并向有关部门送交学位论文的原件与复印件；
\par~\circled{2}~学校可以采用影印、缩印或其它复制手段复制并保存学位论文；
\par~\circled{3}~学校可允许学位论文被查阅或借阅；
\par~\circled{4}~学校可以学术交流为目的,复制赠送和交换学位论文；
\par~\circled{5}~学校可以公布学位论文的全部或部分内容（保密学位论文在解密后遵守此规定）。},
    {originality_author_signature}
      {签\qquad 名：\hspace{40mm}日\hspace{2.5mm}期：\hspace{30mm}\quad},
    {originality_supervisor_signature}
      {导师签名：\hspace{40mm}日\hspace{2.5mm}期：\hspace{30mm}\quad},
  } {\__bithesis_define_label_by_thesis_type:nnn {graduate} #1}
\clist_map_inline:nn
  {
    % TODO: 自动实现汉字均排
    {author} {作\quad 者\quad 姓\quad 名} {Candidate~Name},
    {school} {学\quad 院\quad 名\quad 称} {School~or~Department},
    {supervisor} {指\quad 导\quad 教\quad 师} {Faculty~Mentor},
    {industrial_mentor} {行\smallgap: 业\smallgap: 合\smallgap: 作\smallgap: 导\smallgap: 师} {Industry~Collaboration~Mentor},
    {chairman} {答辩委员会主席} {Chair,~Thesis~Committee},
    % degree、major 的中文与 degreeType 有关，此处以 academic 为准，其余情况通过 \c__bithesis_auto_tl 处理
    % 英文倒是无关。
    {degree} {申\quad 请\quad 学\quad 位} {Degree~Applied},
    {major} {一\quad 级\quad 学\quad 科} {Major},
    {institute}
      {学\smallgap: 位\smallgap: 授\smallgap: 予\smallgap: 单\smallgap: 位}
      {Degree~by},
    {defense_date}
      {论\smallgap: 文\smallgap: 答\smallgap: 辩\smallgap: 日\smallgap: 期}
      {The~Date~of~Defence},
  } {\__bithesis_define_label_by_thesis_type:nnnn {graduate} #1}
\clist_map_inline:nn
  {
    {school} {学\qquad 院} {School},
    {major} {专\qquad 业} {Degree},
    {course} {课程名称} {Course},
    {class} {班\qquad{}级} {Class},
    {author} {学生姓名} {Author},
    {student_id} {学\qquad 号} {Student~ID},
    {supervisor} {指导教师} {Supervisor},
    {co_supervisor} {校外指导教师} {Co-Supervisor},
    {teacher} {任课教师} {Teacher},
    {semester} {上课学期} {Semester},
    {keywords} {关键词：} {Key~Words:~},
    {toc} {目\label_space: 录} {Table~of~Contents},
    {abstract} {摘\label_space: 要} {Abstract},
    {conclusion} {结\label_space: 论} {Conclusions},
    % 附录部分的总标题
    {appendix} {附\label_space: 录} {Appendices},
    {ack} {致\label_space: 谢} {Acknowledgements},
    {figure} {插\label_space: 图} {Illustrations},
    {table} {表\label_space: 格} {Tables},
    % 附录下各部分编号的前缀
    {appendix_prefix} {附录} {Appendix},
    {reference} {参考文献} {References},
    {university} {北京理工大学} {Beijing~Institute~of~Technology},
    {publications} {攻读学位期间发表论文与研究成果清单}
      {Publications~During~Studies},
    % TODO: Not so sure about the translation.
    {resume} {作者简介} {Author~Biography},
    {symbols} {主要符号对照表} {Nomenclature},
    {algo} {算法} {Algorithm},
    {them} {定理} {Theorem},
    {lem} {引理} {Lemma},
    {prop} {命题} {Proposition},
    {cor} {推论} {Corollary},
    {axi} {公理} {Axiom},
    {defn} {定义} {Definition},
    {conj} {猜想} {Conjecture},
    {exmp} {例} {Example},
    {case} {情形} {Case},
    {rem} {注} {Remark},
    {fig} {图} {Figure},
    {tab} {表} {Table},
    {equ} {式} {Equation},
  }
  {\__bithesis_define_label:nnn #1}
\clist_const:Nn \c__bithesis_bachelor_thesis_header_clist
  {
    北京理工大学本科生毕业设计（论文）,
    北京理工大学本科生毕业设计（论文）外文翻译,
    Beijing~Institute~of~Technology~Bachelor's~Thesis,
    北京理工大学硕士学位论文,
    北京理工大学博士学位论文,
  }
\clist_const:Nn \c__bithesis_bachelor_thesis_headline_clist
  {
    本科生毕业设计（论文）,
    本科生毕业设计（论文）外文翻译,
    Beijing\nobreak{~}Institute\nobreak{~}of\nobreak{~}Technology~Bachelor's~Thesis,
  }
\tl_const:Nn \c__bithesis_auto_tl { BIThesis-auto-magic }
\keys_define:nn { bithesis }
{
  info .meta:nn = { bithesis / info } {#1},
  misc .meta:nn = { bithesis / misc } {#1},
  cover .meta:nn = { bithesis / cover } {#1},
  style .meta:nn = { bithesis / style } {#1},
  option .meta:nn = { bithesis / option } {#1},
  TOC .meta:nn = { bithesis / TOC } {#1},
  appendices .meta:nn = { bithesis / appendices } {#1},
  publications .meta:nn = { bithesis / publications } {#1},
  const .meta:nn = { bithesis / const } {#1},
}
\keys_define:nn { bithesis / option }
{
  type .choice:,
  type .value_required:n = true,
  type .choices:Vn =
    \c__bithesis_thesis_type_clist
    {
      \int_set_eq:NN \g__bithesis_thesis_type_int \l_keys_choice_int
      \int_case:nn {\l_keys_choice_int} {
        % 本科全英文也是英文模板。
        {3} {\__bithesis_set_english_mode:}
      }
    },
  type .initial:n = bachelor,
  twoside .bool_gset:N = \g__bithesis_twoside_bool,
  blindPeerReview .bool_gset:N = \g__bithesis_blind_mode_bool,
  ctex .tl_set:N = \l__bithesis_options_to_ctex_tl,
  quirks .bool_gset:N = \g__bithesis_quirks_mode_bool,
  % xeCJK
  autoFakeBold .tl_set:N = \g__bithesis_auto_fake_bold_tl,
  autoFakeBold .initial:n = {3},
  % 是否开启英文模式。目前在设计上，这个选项仅对研究生模板生效。
  % 本科生模板的英文模式是根据 |type| 选项自动判断的。
  english .code:n = { \__bithesis_set_english_mode: } ,
}
\keys_define:nn { bithesis / cover }
  {
    date .tl_set:N = \l__bithesis_cover_date_tl,
    headerImage .tl_set:N = \l_bit_coverheaderimage_tl,
    xiheiFont .tl_set:N = \l__bithesis_cover_xihei_font_path_tl,
    xiheiFont .default:n = {STXihei},
    %% cover entry
    delimiter .tl_set:N = \l__bithesis_cover_delimiter_tl,
    labelAlign .tl_set:N = \l__bithesis_cover_label_align_tl,
    labelAlign .initial:n = {r},
    valueAlign .tl_set:N = \l__bithesis_cover_value_align_tl,
    valueAlign .initial:n = {c},
    labelMaxWidth .dim_set:N = \l__bithesis_cover_label_max_width_dim,
    valueMaxWidth .dim_set:N = \l__bithesis_cover_value_max_width_dim,
    autoWidthPadding .dim_set:N = \l__bithesis_cover_auto_width_padding_dim,
    autoWidthPadding .initial:n = {0.25em},
    autoWidth .bool_set:N = \l__bithesis_cover_auto_width_bool,
    autoWidth .initial:n = {true},
    underlineThickness .dim_set:N = \l__bithesis_cover_underline_thickness_dim,
    underlineThickness .initial:n = {1pt},
    underlineOffset .dim_set:N = \l__bithesis_cover_underline_offset_dim,
    underlineOffset .initial:n = { -10pt },
    hideCoverInPeerReview .bool_set:N = \l__bithesis_cover_hide_cover_in_peer_review_bool,
    % 此处暂且填充默认值为`false`，待确定`\g__bithesis_thesis_type_int`后再根据论文类型覆盖默认值
    hideCoverInPeerReview .initial:n = {false},
    % 研究生的「特殊类型」
    showSpecialTypeBox .bool_set:N = \l__bithesis_cover_show_special_type_box_bool,
    showSpecialTypeBox .initial:n = {false},
    % 本科英文模板也可以使用中文封面
    prefer-zh .bool_set:N = \l__bithesis_cover_prefer_zh_bool,
    prefer-zh .initial:n = {false},
    % 本科英文模板使用中文封面时可能需要调换中英文标题顺序
    reverse-titles .bool_set:N = \l__bithesis_cover_reverse_titles_bool,
    reverse-titles .initial:n = {false},
    % 本科英文模板可加入中文标题
    addTitleZh .bool_set:N = \l__bithesis_cover_add_titlezh_bool,
    addTitleZh .initial:n = {true},
  }
\keys_define:nn { bithesis / info }
  {
    title .tl_set:N = \l__bithesis_value_title_tl,
    title .initial:n = {形状记忆聚氨酯的合成及其在织物中的应用（示例）},
    titleEn .tl_set:N = \l__bithesis_value_title_en_tl,
    titleEn .initial:n = {Synthesis~and~Application~on~Texttiles~of~the~Shape~Memory~Polyurethane~(example)},
    % 因为是覆盖选项，所以不需要设置初始值。
    verticalTitle .tl_set:N = \l__bithesis_value_vertical_title_tl,
    school .tl_set:N = \l__bithesis_value_school_tl,
    major .tl_set:N = \l__bithesis_value_major_tl,
    class .tl_set:N = \l__bithesis_value_class_tl,
    % 课程名称，读书报告使用
    course .tl_set:N = \l__bithesis_value_course_tl,
    author .tl_set:N = \l__bithesis_value_author_tl,
    studentId .tl_set:N = \l__bithesis_value_student_id_tl,
    % 指导教师
    supervisor .tl_set:N = \l__bithesis_value_supervisor_tl,
    % 因为默认不显示，所以不需要设置初始值。
    externalSupervisor .tl_set:N = \l__bithesis_value_external_supervisor_tl,
    % 任课教师，读书报告使用
    teacher .tl_set:N = \l__bithesis_value_teacher_tl,
    % 上课学期，读书报告使用
    semester .tl_set:N = \l__bithesis_value_semester_tl,
    keywords .tl_set:N = \l__bithesis_value_keywords_tl,
    keywords .initial:n = {聚氨酯,形状记忆,织物（示例）},
    keywordsEn .tl_set:N = \l__bithesis_value_keywords_en_tl,
    keywordsEn .initial:n = {Polyurethane,Shape Memory,Textiles (example)},
    translationTitle .tl_set:N = \l__bithesis_value_trans_title_tl,
    translationOriginTitle .tl_set:N = \l__bithesis_value_trans_origin_title_tl,
    % 中图分类号，研究生学位论文使用
    classification .tl_set:N = \l__bithesis_value_classification_tl,
    classification .initial:n = {TQ~028.1（示例）},
    % UDC 分类号，研究生学位论文使用
    UDC .tl_set:N = \l__bithesis_value_udc_tl,
    UDC .initial:n = {540（示例）},
    % 学术型/专业型，研究生学位论文使用
    degreeType .choice:,
    degreeType .choices:nn = {professional, academic} {
      \tl_set:Nn \l__bithesis_value_degree_type_tl {#1}
    },
    degreeType .initial:n = academic,
    chairman .tl_set:N = \l__bithesis_value_chairman_tl,
    industrialMentor .tl_set:N = \l__bithesis_value_industrial_mentor_tl,
    industrialMentorEn .tl_set:N = \l__bithesis_value_industrial_mentor_en_tl,
    degree .tl_set:N = \l__bithesis_value_degree_tl,
    degreeEn .tl_set:N = \l__bithesis_value_degree_en_tl,
    institute .tl_set:N = \l__bithesis_value_institute_tl,
    institute .initial:n = {\tl_use:N \c__bithesis_label_university_tl},
    defenseDate .tl_set:N = \l__bithesis_value_defense_date_tl,
    authorEn .tl_set:N = \l__bithesis_value_author_en_tl,
    schoolEn .tl_set:N = \l__bithesis_value_school_en_tl,
    supervisorEn .tl_set:N = \l__bithesis_value_supervisor_en_tl,
    chairmanEn .tl_set:N = \l__bithesis_value_chairman_en_tl,
    majorEn .tl_set:N = \l__bithesis_value_major_en_tl,
    instituteEn .tl_set:N = \l__bithesis_value_institute_en_tl,
    instituteEn .initial:n = {\c__bithesis_label_university_en_tl},
    defenseDateEn .tl_set:N = \l__bithesis_value_defense_date_en_tl,
    defenseDateEn .initial:n = {June,~2019~(example)},
    % 因为默认不显示，所以不需要设置初始值。
    classifiedLevel .tl_set:N = \l__bithesis_value_classified_level_tl,
    % 学生类型-工程硕博士专项
    工程硕博士专项 .bool_set:N = \l__bithesis_value_engineering_special_plan_bool,
    工程硕博士专项 .initial:n = {false},
    % 学生类型-交叉研究方向
    crossResearch .bool_set:N = \l__bithesis_value_cross_research_bool,
    crossResearch .initial:n = {false},
    % 学生类型-政府项目留学生
    internationalStudentUGP .bool_set:N = \l__bithesis_value_international_student_ugp_bool,
    internationalStudentUGP .initial:n = {false},
  }
\keys_define:nn { bithesis / misc }
  {
    % 表格字体大小，默认为 5 号字体。
    tabularFontSize .tl_set:N = \l__bithesis_misc_tabular_font_size_tl,
    tabularFontSize .initial:n = {5},
    arialFont .tl_set:N = \l__bithesis_misc_arial_font_path_tl,
    autoref / algo .tl_set:N = \l__bithesis_misc_autoref_algo_tl,
    autoref / algo .initial:n = {\g__bithesis_const_autoref_algo_tl},
    autoref / them .tl_set:N = \themautorefname,
    autoref / them .initial:n = {\g__bithesis_const_autoref_them_tl},
    autoref / lem .tl_set:N = \lemautorefname,
    autoref / lem .initial:n = {\g__bithesis_const_autoref_lem_tl},
    autoref / prop .tl_set:N = \propautorefname,
    autoref / prop .initial:n = {\g__bithesis_const_autoref_prop_tl},
    autoref / cor .tl_set:N = \corautorefname,
    autoref / cor .initial:n = {\g__bithesis_const_autoref_cor_tl},
    autoref / axi .tl_set:N = \axiautorefname,
    autoref / axi .initial:n = {\g__bithesis_const_autoref_axi_tl},
    autoref / defn .tl_set:N = \defnautorefname,
    autoref / defn .initial:n = {\g__bithesis_const_autoref_defn_tl},
    autoref / conj .tl_set:N = \conjautorefname,
    autoref / conj .initial:n = {\g__bithesis_const_autoref_conj_tl},
    autoref / exmp .tl_set:N = \exmpautorefname,
    autoref / exmp .initial:n = {\g__bithesis_const_autoref_exmp_tl},
    autoref / case .tl_set:N = \caseautorefname,
    autoref / case .initial:n = {\g__bithesis_const_autoref_case_tl},
    autoref / rem .tl_set:N = \remautorefname,
    autoref / rem .initial:n = {\g__bithesis_const_autoref_rem_tl},
    hideLinks .bool_set:N = \l__bithesis_misc_hide_links_bool,
    hideLinks .initial:n = {true},
    autoref / figure .tl_set:N = \figureautorefname,
    autoref / figure .initial:n = {\g__bithesis_const_autoref_fig_tl},
    autoref / table .tl_set:N = \tableautorefname,
    autoref / table .initial:n = {\g__bithesis_const_autoref_tab_tl},
    autoref / equ .tl_set:N = \equationautorefname,
    autoref / equ .initial:n = {\g__bithesis_const_autoref_equ_tl},
    % 浮动体相关的各种间距
    floatSeparation .tl_set:N = \l__bithesis_misc_float_separation_tl,
    floatSeparation .initial:n = {0},
    algorithmSeparation .tl_set:N = \l__bithesis_misc_algorithm_separation_tl,
    algorithmSeparation .initial:n = {12pt plus 4pt minus 4pt},
    tabularRowSeparation .tl_set:N = \l__bithesis_misc_tabular_row_separation_tl,
    tabularRowSeparation .initial:n = {1},
  }
\keys_define:nn { bithesis / const }
  {
    autoref .meta:nn = { bithesis / const / autoref } { #1 },
    style .meta:nn = { bithesis / const / style } { #1 },
    info .meta:nn = { bithesis / const / info } { #1 },
    heading .meta:nn = { bithesis / const / heading } { #1 },
  }
\keys_define:nn { bithesis / const / autoref }
  {
    algo .tl_set:N = \g__bithesis_const_autoref_algo_tl,
    algo .initial:n = {\__bithesis_get_const:N {algo}},
    them .tl_set:N = \g__bithesis_const_autoref_them_tl,
    them .initial:n = {\__bithesis_get_const:N {them}},
    lem .tl_set:N = \g__bithesis_const_autoref_lem_tl,
    lem .initial:n = {\__bithesis_get_const:N {lem}},
    prop .tl_set:N = \g__bithesis_const_autoref_prop_tl,
    prop .initial:n = {\__bithesis_get_const:N {prop}},
    cor .tl_set:N = \g__bithesis_const_autoref_cor_tl,
    cor .initial:n = {\__bithesis_get_const:N {cor}},
    axi .tl_set:N = \g__bithesis_const_autoref_axi_tl,
    axi .initial:n = {\__bithesis_get_const:N {axi}},
    defn .tl_set:N = \g__bithesis_const_autoref_defn_tl,
    defn .initial:n = {\__bithesis_get_const:N {defn}},
    conj .tl_set:N = \g__bithesis_const_autoref_conj_tl,
    conj .initial:n = {\__bithesis_get_const:N {conj}},
    exmp .tl_set:N = \g__bithesis_const_autoref_exmp_tl,
    exmp .initial:n = {\__bithesis_get_const:N {exmp}},
    case .tl_set:N = \g__bithesis_const_autoref_case_tl,
    case .initial:n = {\__bithesis_get_const:N {case}},
    rem .tl_set:N = \g__bithesis_const_autoref_rem_tl,
    rem .initial:n = {\__bithesis_get_const:N {rem}},
    figure .tl_set:N = \g__bithesis_const_autoref_fig_tl,
    figure .initial:n =  {\__bithesis_get_const:N {fig}},
    table .tl_set:N = \g__bithesis_const_autoref_tab_tl,
    table .initial:n =  {\__bithesis_get_const:N {tab}},
    equ .tl_set:N = \g__bithesis_const_autoref_equ_tl,
    equ .initial:n = {\__bithesis_get_const:N {equ}},
  }
\keys_define:nn { bithesis / const / style }
  {
    substituteSymbol .tl_set:N = \g__bithesis_const_substitute_symbol_tl,
    substituteSymbol .initial:n = {*},
  }
\keys_define:nn { bithesis / const / info }
  {
    degree .tl_set:N = \g__bithesis_const_info_degree_tl,
    degree .initial:n = {\c__bithesis_auto_tl},
    major .tl_set:N = \g__bithesis_const_info_major_tl,
    major .initial:n = {\c__bithesis_auto_tl},
  }
\keys_define:nn { bithesis / const / heading }
  {
    acknowledgements .tl_set:N = \g__bithesis_const_heading_acknowledgements_tl,
    acknowledgements .initial:n = {
      \__bithesis_get_const:N {ack}
    },
  }
\keys_define:nn { bithesis / style }
{
  head .tl_set:N = \l__bithesis_style_head_tl,
  head .initial:n = {
    \clist_item:Nn \c__bithesis_bachelor_thesis_header_clist \g__bithesis_thesis_type_int
  },
  headline .tl_set:N = \l__bithesis_style_headline_tl,
  headline .initial:n = {
    \clist_item:Nn \c__bithesis_bachelor_thesis_headline_clist \g__bithesis_thesis_type_int
  },
  bibliographyIndent .bool_set:N = \l__bithesis_style_bibliography_indent_bool,
  bibliographyIndent .initial:n = {true},
  pageVerticalAlign .choices:nn = {top, scattered} {
    \tl_if_eq:NnTF \l_keys_choice_tl {top}
      { \raggedbottom }
      { \flushbottom }
  },
  pageVerticalAlign .initial:n = {top},
  non-CJK-font-in-headings .choice:,
  non-CJK-font-in-headings / serif .code:n = { \bool_set_false:N \l__bithesis_arial_as_title_font_bool },
  non-CJK-font-in-headings / sans .code:n = { \bool_set_true:N \l__bithesis_arial_as_title_font_bool },
  non-CJK-font-in-headings .initial:n = {serif},
  % 数学字体配置
  mathFont .choices:nn = {
    asana, bonum, cm, concrete, dejavu, erewhon, euler,
    fira, garamond, gfsneohellenic, kp, libertinus, lm, newcm,
    pagella, schola, stix, stix2, termes, xcharter, xits, none,
    } { \tl_set_eq:NN \l__bithesis_style_math_font_tl \l_keys_choice_tl },
  mathFont .initial:n = {cm},
  % Options that will be pass to `unicode-math` pkgs.
  unicodeMathOptions .tl_set:N = \l__bithesis_unicode_math_options_tl,
  % Windows 平台开启宋体伪粗体。
  windowsSimSunFakeBold .bool_set:N = \l__bithesis_style_windows_simsum_fake_bold,
  windowsSimSunFakeBold .initial:n = {false},
  % 控制英文是否使用 hyphen 进行换行
  hyphen .bool_set:N = \l__bithesis_style_hyphen_bool,
  hyphen .initial:n = {true},
  % 控制公式和上下文的距离
  mathAboveDisplaySkip .dim_set:N = \l__bithesis_style_math_above_display_skip_dim,
  mathAboveDisplaySkip .initial:n = {10pt},
  mathBelowDisplaySkip .dim_set:N = \l__bithesis_style_math_below_display_skip_dim,
  mathBelowDisplaySkip .initial:n = {10pt},
  betterTimesNewRoman .bool_set:N = \l__bithesis_style_better_new_roman_bool,
  betterTimesNewRoman .initial:n = {false},
}
\keys_define:nn { bithesis / TOC }
{
  title .tl_set:N = \l__bithesis_toc_title_tl,
  title .initial:n = {
    \__bithesis_get_const:N {toc}
  },
  abstract .bool_set:N = \l__bithesis_add_abstract_to_toc_bool,
  abstract .initial:n = {true},
  abstractEn .bool_set:N = \l__bithesis_add_abstract_en_to_toc_bool,
  abstractEn .initial:n = {true},
  TOC .bool_set:N = \l__bithesis_add_toc_to_toc_bool,
  TOC .initial:n = {false},
  symbols .bool_set:N = \l__bithesis_add_symbols_to_toc_bool,
  symbols .initial:n = {true},
}
\keys_define:nn { bithesis / appendices }
{
  chapterLevel .bool_set:N = \l__bithesis_appendices_chapter_level_bool,
  title .tl_set:N = \l__bithesis_appendices_title_tl,
  TOCTitle .tl_set:N = \l__bithesis_appendix_toc_title_tl,
}
\keys_define:nn { bithesis / publications }
{
  % mode .choice:,
  % mode .value_required:n = true,
  % mode .choices:Vn =
  %   \c__bithesis_publication_modes_clist
  %   {
  %     \int_new:N \l__bithesis_publication_mode_int
  %     \int_set:Nn \l__bithesis_publication_mode_int \l_keys_choice_int
  %   },
  % mode .initial:n = biblatex,
  sorting .bool_set:N = \l__bithesis_publications_sorting_bool,
  sorting .initial:n = {true},
  omit .bool_set:N = \l__bithesis_publications_omit_bool,
  omit .initial:n = {false},
  maxbibnames .int_set:N = \l__bithesis_publications_maxbibnames_int,
  maxbibnames .initial:n = {10},
  minbibnames .int_set:N = \l__bithesis_publications_minbibnames_int,
  minbibnames .initial:n = {10},
}
\ProcessKeysOptions { bithesis / option }
\__bithesis_if_graduate:TF {
  \keys_set:nn {bithesis} {cover/hideCoverInPeerReview = false}
} {
  \keys_set:nn {bithesis} {cover/hideCoverInPeerReview = true}
}
\cs_new:Npn \__bithesis_resolve_auto_values: {
  \tl_if_eq:NnT \g__bithesis_const_info_degree_tl {\c__bithesis_auto_tl} {
    \tl_if_eq:NnTF \l__bithesis_value_degree_type_tl {academic} {
      \keys_set:nn {bithesis} {const/info/degree = \c__bithesis_graduate_label_degree_tl}
    } {
      \keys_set:nn {bithesis} {const/info/degree = 申\quad 请\quad 类\quad 别}
    }
  }
  \tl_if_eq:NnT \g__bithesis_const_info_major_tl {\c__bithesis_auto_tl} {
    \__bithesis_if_graduate:TF {
      \tl_if_eq:NnTF \l__bithesis_value_degree_type_tl {academic} {
        \keys_set:nn {bithesis} {const/info/major = \c__bithesis_graduate_label_major_tl}
      } {
        \keys_set:nn {bithesis} {const/info/major = 学\quad 位\quad 领\quad 域}
      }
    } {
      \keys_set:nn {bithesis} {const/info/major = \__bithesis_get_const:N {major}}
    }
  }
}
\__bithesis_if_thesis_english:T {
  \PassOptionsToClass{scheme=plain}{ctexbook}
}
\bool_if:NT \g__bithesis_blind_mode_bool {
  \bool_set_false:N \g__bithesis_twoside_bool
}
\bool_if:NTF \g__bithesis_twoside_bool {} {
  \PassOptionsToClass{oneside}{ctexbook}
}
\PassOptionsToClass{openany}{ctexbook}
\DeclareOption*{
  \PassOptionsToClass{\l__bithesis_options_to_ctex_tl}{ctexbook}
}
\PassOptionsToPackage{quiet,AutoFakeBold=\g__bithesis_auto_fake_bold_tl,AutoFakeSlant}{xeCJK}
\ProcessOptions\relax
\LoadClass[zihao=-4,]{ctexbook}
\RequirePackage{geometry}
\RequirePackage[table,xcdraw]{xcolor}
\RequirePackage{xeCJK}
\RequirePackage[bodytextleadingratio=1.56]{zhlineskip}
\RequirePackage{titletoc}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{pdfpages}
\RequirePackage[nodisplayskipstretch]{setspace}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{tikz}
\RequirePackage{etoolbox}
\RequirePackage[bookmarksnumbered]{hyperref}
\RequirePackage[strut=off]{caption}
\RequirePackage{array}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{pifont}
\RequirePackage{amsthm}
\RequirePackage{pdfpages}
\RequirePackage{listings}
\RequirePackage{enumitem}
\RequirePackage{fmtcount}
\pdfstringdefDisableCommands{%
  \let\quad\empty
}
\__bithesis_if_graduate:TF {
  \int_set:Nn \g__bithesis_head_zihao_int {5}
  \geometry{
    a4paper,
    left=2.7cm,
    bottom=2.5cm + 7bp,
    top=3.5cm + 7bp,
    right=2.7cm,
    % `headsep' is affected by `top' option.
    headsep = 3.5cm + 7bp - 2.5cm - 15bp,
    headheight = 15 bp,
    % `footskip' is affected by `bottom' option.
    footskip = 2.5cm + 7bp - 1.8cm,
  }
} {
  \int_set:Nn \g__bithesis_head_zihao_int {4}
  \geometry{
    a4paper,
    left=3cm,
    bottom=2.6cm + 7bp,
    top=3.5cm + 7bp,
    right=2.6cm,
    % `headsep' is affected by `top' option.
    headsep = 3.5cm + 7bp - 2.4cm - 20bp,
    headheight = 20 bp,
    % `footskip' is affected by `bottom' option.
    footskip = 2.6cm + 7bp - 2cm,
  }
}
\ctex_at_end_preamble:n {
  \bool_if:NTF \l__bithesis_style_better_new_roman_bool {
    \defaultfontfeatures[TeX~Gyre~Termes]
    {
     Extension      = .otf ,
     UprightFont    = texgyretermes-regular,
     BoldFont       = texgyretermes-bold,
     ItalicFont     = texgyretermes-italic,
     BoldItalicFont = texgyretermes-bolditalic,
    }
    \setmainfont{TeX~Gyre~Termes}
  }{
    \setmainfont{Times~New~Roman}
    \setromanfont{Times~New~Roman}
  }
}
\cs_new:Npn \__bithesis_font_path:
  {
    \str_if_eq:NNTF { \l__bithesis_font_type_tl } { font }
      { }
      { Path = \l__bithesis_font_path_tl / , }
  }
\cs_new:Npn \__bithesis_load_unicode_math_pkg:
  {
    \PassOptionsToPackage { \l__bithesis_unicode_math_options_tl } { unicode-math }
    \RequirePackage { unicode-math }
  }
\cs_new:Npn \__bithesis_define_math_font:nn #1#2
  {
    \cs_new:cpn { __bithesis_load_math_font_ #1 : }
      {
        \__bithesis_load_unicode_math_pkg:
        \setmathfont { #2 }
      }
  }
\clist_map_inline:nn
  {
    { asana          } { Asana-Math.otf             },
    { concrete       } { Concrete-Math.otf          },
    { erewhon        } { Erewhon-Math.otf           },
    { euler          } { Euler-Math.otf             },
    { fira           } { FiraMath-Regular.otf       },
    { garamond       } { Garamond-Math.otf          },
    { gfsneohellenic } { GFSNeohellenicMath.otf     },
    { kp             } { KpMath-Regular.otf         },
    { libertinus     } { LibertinusMath-Regular.otf },
    { lm             } { latinmodern-math.otf       },
    { newcm          } { NewCMMath-Regular.otf      },
    { stix           } { STIXMath-Regular.otf       },
    { stix2          } { STIXTwoMath-Regular.otf    },
    { xcharter       } { XCharter-Math.otf          },
    { xits           } { XITSMath-Regular.otf       },
    { bonum          } { texgyrebonum-math.otf      },
    { dejavu         } { texgyredejavu-math.otf     },
    { pagella        } { texgyrepagella-math.otf    },
    { schola         } { texgyreschola-math.otf     },
    { termes         } { texgyretermes-math.otf     }
  }
  { \__bithesis_define_math_font:nn #1 }
\cs_new:Npn \__bithesis_load_math_font_cm: { }
\cs_new:Npn \__bithesis_load_math_font_none: { }
\cs_new:Npn \__bithesis_load_font:
  {
    \use:c { __bithesis_load_math_font_  \l__bithesis_style_math_font_tl  : }
  }
\ctex_at_end_preamble:n {
  % 针对 Windows 字体采用 Fake Bold 宋体
  \bool_if:NT \l__bithesis_style_windows_simsum_fake_bold
  {
    \RequirePackage{ifplatform}
    \ifwindows
      \setCJKmainfont{SimSun}[AutoFakeBold,AutoFakeSlant]
    \fi
  }

  % 在导言区末尾加载数学字体。
  \__bithesis_load_font:

  % misc / hideLinks 选项
  \bool_if:NTF \l__bithesis_misc_hide_links_bool
    {
      \hypersetup { hidelinks }
    } {
      \definecolor{blue}{RGB}{10,10,110}
      \hypersetup{
        colorlinks=true,
      }
    }

  \bool_if:NTF \l__bithesis_arial_as_title_font_bool {
    % 手动指定时要加载 Arial
    \newfontfamily\arialfamily{Arial}
  } {
    % 即使未指定，本科全英文专业模板的声明也需要 Arial
    \__bithesis_if_thesis_int_type:nT {3} {
      \newfontfamily\arialfamily{Arial}
    }
  }
  % 无论中英文，封面都可能需要细黑体。
  \tl_if_blank:VTF \l__bithesis_cover_xihei_font_path_tl {}
  {
    \setCJKfamilyfont{xihei}[AutoFakeBold,AutoFakeSlant]
      {\l__bithesis_cover_xihei_font_path_tl}
  }

  % 对于本科全英文专业模板，需要自定义日期格式。
  \__bithesis_if_thesis_int_type:nT {3} {
    \RequirePackage[en-US]{datetime2}
    \RequirePackage{indentfirst}
    \DTMlangsetup[en-US]{dayyearsep={\space}}
  }

  % Define biblatex category if it was imported.
  % 这部分是给研究生模板中的
  % 「攻读学位期间发表论文与研究成果清单」使用的。
  \cs_if_exist:NT \DeclareBibliographyCategory {
    \DeclareBibliographyCategory{mypub}
  }

  % Define biblatex strings if it was imported.
  % 这部分是给研究生模板中的
  % gbpunctin = false 时使用的。
  \cs_if_exist:NT \DefineBibliographyStrings {
    \DefineBibliographyStrings{english}{in={}}
    \DefineBibliographyStrings{english}{incn={}}
  }

  % 修改 biblatex 中「专利」（patent）部分的著录格式。
  % 主要根据北理工自定义的规范，参考 biblatex 和
  % biblatex-gb7714-2015 的实现修改而成。
  %
  % 默认不开启，因为此修改可能会产生其他边界问题。
  \bool_if:NT \g__bithesis_quirks_mode_bool {
    \cs_if_exist:NT \DeclareBibliographyDriver {
      %
      %   重设专利title的输出，将文献类型标识符输出出去
      %
      \newbibmacro*{patenttitle}{%原输出来自biblatex.def文件
        \ifboolexpr{%
          test{\iffieldundef{title}}%
          and%
          test{\iffieldundef{subtitle}}%
        }%
          {}%
          {\printtext[title]{\bibtitlefont%
             \printfield[titlecase]{title}%
             \ifboolexpr{test {\iffieldundef{subtitle}}}%这里增加了对子标题的判断，解决不判断多一个点的问题
             {}{\setunit{\subtitlepunct}%
             \printfield[titlecase]{subtitle}}%
              \iftoggle{bbx:gbtype}{\printfield[gbtypeflag]{usera}}{}%
             \iffieldundef{titleaddon}{}%判断一下titleaddon，否则直接加可能多一个空格
              {\setunit{\subtitlepunct}\printfield{titleaddon}}%
              % ：地区
              \setunit{\subtitlepunct}\iflistundef{location}
                {}
                {\setunit*{\subtitlepunct}%
                 \printtext{%[parens]
                   \printlist[][-\value{listtotal}]{location}}}%
              % ，专利号
              \setunit{\addcomma\addspace}\printfield{number}%写专利号
              \setunit{\addcomma\addspace}
              \usebibmacro{newsdate}%
           }%
        }%
      }

      %
      %   重定义专利文献驱动
      %
        \DeclareBibliographyDriver{patent}{%源来自standard.BBX
        \usebibmacro{bibindex}%
        \usebibmacro{begentry}%
        \usebibmacro{author}%
        \ifnameundef{author}{}{\setunit{\labelnamepunct}\newblock}%这一段用于去除作者不存在时多出的标点
        \usebibmacro{patenttitle}%给出专利专用的标题输出
        \iftoggle{bbx:gbstrict}{}{%
          \newunit%
          \printlist{language}%
          \newunit\newblock
          \usebibmacro{byauthor}
        }%
        \newunit\newblock
        \printfield{type}%
        \setunit*{\addspace}%
        \newunit\newblock
        \usebibmacro{byholder}%
        \newunit\newblock
        \printfield{note}%
        \newunit\newblock
        \usebibmacro{doi+eprint+url}%
        \newunit\newblock
        \usebibmacro{addendum+pubstate}%
        \setunit{\bibpagerefpunct}\newblock
        \usebibmacro{pageref}%
        \newunit\newblock
        \iftoggle{bbx:related}
          {\usebibmacro{related:init}%
           \usebibmacro{related}}
          {}%
        \usebibmacro{annotation}\usebibmacro{finentry}}
    }
  }
}
\cs_new:Npn \xihei:n #1 {
  \xeCJK_family_if_exist:nTF {xihei} {
    \CJKfamily{xihei} #1
  }{
    \heiti #1
  }
}
\cs_new:Npn \l__bithesis_title_font_cs:n #1 {
  \bool_if:NTF \l__bithesis_arial_as_title_font_bool
  {
    % 即使是英文模板，仍可能出现中文，也需设置中文字体。
    \heiti\arialfamily #1
  } {
    % 西文保持原本的 Times New Roman。黑体一般不搭配衬线体，但学校要求如此。
    \heiti #1
  }
}
\cs_new:Npn \l__bithesis_unnumchapter_style_cs:n #1 {
  % 本科全英文、研究生学位论文需要加粗
  \int_compare:nNnTF {\g__bithesis_thesis_type_int} > {2}
  {
    \bfseries #1
  } {
    \mdseries #1
  }
}
\cs_set:Npn \arabicHeiti #1 {#1}
\fancypagestyle{BIThesis}{
  \fancyhf{}
  % 定义页眉、页码
  \fancyhead[C]{
    \zihao{\int_use:N \g__bithesis_head_zihao_int}
    \ziju{0.08}
    \songti{\tl_use:N \l__bithesis_style_head_tl}
  }
  \fancyfoot[C]{\songti\zihao{5} \thepage}
  % 页眉分割线稍微粗一些
  \RenewDocumentCommand \headrulewidth {} {0.6pt}
}
\ctexset{chapter={
    number = {\arabicHeiti{ \arabic{chapter} }},
    format = { \l__bithesis_title_font_cs:n \bfseries \centering \zihao{3}},
    nameformat = {},
    titleformat = {},
    aftername = \hspace{9bp},
    pagestyle = BIThesis,
    beforeskip = \__bithesis_if_graduate:TF {13bp} {8bp},
    afterskip = \__bithesis_if_graduate:TF {24.5bp} {32bp},
    fixskip = true,
    lofskip = 0cm,
    lotskip = 0cm,
  }
}

\ctexset{section={
    number = {\arabicHeiti{\thechapter.\hspace{1bp}\arabic{section}}},
    format = {\l__bithesis_title_font_cs:n \raggedright \bfseries \zihao{4}},
    nameformat = {},
    titleformat = {},
    aftername = \hspace{8bp},
    beforeskip = \__bithesis_if_graduate:TF {26bp} {20bp},
    afterskip = \__bithesis_if_graduate:TF {18bp} {17bp},
    fixskip = true,
  }
}

\ctexset{subsection={
    number = {
      \arabicHeiti{
        \thechapter.\hspace{1bp}
        \arabic{section}.\hspace{1bp}
        \arabic{subsection}
      }
    },
    format = {\l__bithesis_title_font_cs:n \bfseries \raggedright \zihao{-4}},
    nameformat = {},
    titleformat = {},
    aftername = \hspace{7bp},
    beforeskip = 17bp,
    afterskip = 17bp,
    fixskip = true,
  }
}

\ctexset{
  secnumdepth = 3,
  subsubsection={
    numbering = true,
    number = {
      \arabicHeiti{
        \arabic{chapter}.\hspace{1bp}
        \arabic{section}.\hspace{1bp}
        \arabic{subsection}.\hspace{1bp}
        \arabic{subsubsection}
      }
    },
    format={\l__bithesis_title_font_cs:n \raggedright \zihao{-4}},
    nameformat = {},
    titleformat = {},
    beforeskip=14bp,
    afterskip=14bp,
    fixskip=true,
  }
}
\addtocontents{toc}{\protect\hypersetup{hidelinks}}

\__bithesis_if_graduate:TF {
  % 对于研究生模板，定义各章标题为宋体四号。
  \titlecontents{chapter}[0pt]{\songti \zihao{4}}
  {\thecontentslabel\hspace{\ccwd}}{}
  {\hspace{.5em}\titlerule*{.}\contentspage}
  % section 标题为宋体小四号。缩进为两个字符宽度。
  \titlecontents{section}[2\ccwd]{\songti \zihao{-4}}
  {\thecontentslabel\hspace{\ccwd}}{}
  {\hspace{.5em}\titlerule*{.}\contentspage}
  % subsection 标题为宋体小四号。缩进为四个字符宽度。
  \titlecontents{subsection}[4\ccwd]{\songti \zihao{-4}}
  {\thecontentslabel\hspace{\ccwd}}{}
  {\hspace{.5em}\titlerule*{.}\contentspage}
} {
  % 对于其他，定义各章标题为宋体小四号。
  \titlecontents{chapter}[0pt]{\songti \zihao{-4}}
  {\thecontentslabel\hspace{\ccwd}}{}
  {\hspace{.5em}\titlerule*{.}\contentspage}
  % section 标题为宋体小四号。
  \titlecontents{section}[1\ccwd]{\songti \zihao{-4}}
  {\thecontentslabel\hspace{\ccwd}}{}
  {\hspace{.5em}\titlerule*{.}\contentspage}
  % subsection 标题为宋体小四号。
  \titlecontents{subsection}[2\ccwd]{\songti \zihao{-4}}
  {\thecontentslabel\hspace{\ccwd}}{}
  {\hspace{.5em}\titlerule*{.}\contentspage}
}
\titlecontents{figure}[0pt]{\songti\zihao{-4}}
    {\figurename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{table}[0pt]{\songti\zihao{-4}}
    {\tablename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\RenewDocumentCommand \frontmatter {} {
  \pagenumbering{Roman}
  % 这部分的章节标题不进行编号。
  \ctexset{
    chapter = {
      numbering = false,
    }
  }
  \linespread{1.53}\selectfont
  \pagestyle{BIThesis}

  % 调整表格内容字号（默认五号）和各行之间的距离。
  %
  % 由于这种方式会影响所有的表格，
  % 所以我们尽可能延迟这种影响。
  %
  % 不过，在目前的代码实现中没有在封面
  % 之类的地方使用表格，所以目前即使放在
  % preamble 中也不会有影响。
  %
  % 支持标准tabular、tabular*环境和宏包tabularx、longtable。
  %
  % 为保证各种表格效果一致，要先手动重置setspace宏包漏掉的longtable；
  \AtBeginEnvironment {longtable} {\singlespacing}
  % 之后再统一设置。
  \clist_map_inline:nn
    {tabular, tabular*, tabularx, longtable}
    {
      \AtBeginEnvironment {##1} {
        % 字号只想设置表格内容，不想影响caption。
        % 一般caption在环境之外，自然不受影响；
        % 而longtable的caption虽在环境内，但caption宏包能正常处理。
        \zihao{\l__bithesis_misc_tabular_font_size_tl}
        % 各行间距只想影响表格，不想影响矩阵，因此也必须在钩子中设置。
        \cs_set:Npn \arraystretch {\l__bithesis_misc_tabular_row_separation_tl}
      }
    }
}
\RenewDocumentCommand \mainmatter {} {
  % 另起一个空页，以便于后续的章节标题编号。
  % \clearpage
  \cleardoublepage
  % 这部分的章节标题进行编号。
  \ctexset{
    chapter = {
      numbering = true,
    }
  }
  % 页码使用阿拉伯数字。
  \pagenumbering{arabic}
  \pagestyle{BIThesis}
  % 正文 22 磅的行距
  \setlength{\parskip}{0em}
  \linespread{1.53}\selectfont
  % 修复脚注出现跨页的问题
  \interfootnotelinepenalty=10000
}
\RenewDocumentCommand \backmatter {} {
  % 同样，所有的章节标题不进行编号。
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \setcounter{subsubsection}{0}
  \ctexset{
    chapter = {
      numbering = false,
      beforeskip = 18bp,
      format = {
        \l__bithesis_title_font_cs:n \l__bithesis_unnumchapter_style_cs:n \centering \zihao{3}
      },
      afterskip = \__bithesis_if_graduate:TF {31bp} {26bp},
    }
  }
}
\__bithesis_if_bachelor_thesis:TF {
  \setlength{\abovecaptionskip}{11pt}

  % 调整表格 caption 和表格本体间的距离。
  \__bithesis_if_thesis_english:TF {
    % 英文模板缺乏规定，只调整中文模板
  } {
    % 本来默认有一定空隙，现改为紧贴，这样更接近Word模板实作。
    \captionsetup[table]{skip=5pt}
  }
} {
  \captionsetup[table]{skip=8bp}
}
\__bithesis_if_bachelor_thesis:TF {
  % 浮动体位于正文中间时，调整浮动体与上下正文之间的距离，即"前后加上一行空白"
  \setlength{\intextsep}{1.80\baselineskip plus 0.2\baselineskip minus 0.2\baselineskip}
  % 浮动体位于页面顶部或底部时，调整浮动体与正文之间的距离，后或前加上一行空白
  \setlength{\textfloatsep}{1.80\baselineskip plus 0.2\baselineskip minus 0.2\baselineskip}

  \__bithesis_if_thesis_english:TF {
    \setlength{\belowcaptionskip}{9pt}
  } {
    % 为了满足“前后一行空白的问题”，需要删除 caption 下方的间距。
    %
    % 这里实际的 skip 在 15pt 左右，但是全部移除会导致当图片置于页面顶部时，
    % 图片与上方的间距过小，因此这里只移除 5pt。
    % 当然，这样会导致文本间的图片的 caption 下方的间距微微大于一行。
    %
    % 至于表格，`caption`宏包已考虑布局区别，统一设置 belowskip 即可。
    \captionsetup{belowskip=-5pt}
    % 不过 longtable 宏包有另外的机制，不设置 belowskip 时间距已可较小，
    % 设置成负数还导致 caption 和表格本体的距离变大。因此我们撤销更改。
    \captionsetup[longtable]{belowskip=0pt}

  }
  \AtBeginDocument {
    % longtable 宏包有另外的机制，需专门调整
    \@ifpackageloaded{longtable}{
      \setlength{\LTpre}{0.60\baselineskip plus 0.2\baselineskip minus 0.2\baselineskip}
      \setlength{\LTpost}{1.60\baselineskip plus 0.2\baselineskip minus 0.2\baselineskip}
    }{}
  }
} {
  % 保留“正文 🡘 图片本体”距离不动，缩小“表格本体 🡘 正文”实际距离，使二者相近
  \AtBeginEnvironment{table}{
    \setlength{\intextsep}{3bp plus 1pt minus 1pt}
  }

  % 调整“正文 🡘 表格 caption”距离
  \captionsetup[table]{belowskip = 6bp + 0.25\baselineskip}

  % 调整“图片 caption 🡘 正文”距离
  % 这一距离是 intextsep 与 belowcaptionskip 之和。
  % 前者在小四 ctexbook 中默认为`14.0pt plus 4.0pt minus 4.0pt`，我们未改。
  % 计算下来，后者应设置为 14.0pt - 6bp 左右。
  \captionsetup[figure]{belowskip = -12pt}
  % 浮动体连续排列时，补偿以上负间距
  \addtolength{\floatsep}{12pt}

  % 适配子图
  \captionsetup[subfigure]{aboveskip = 3bp, belowskip = 3bp}

  \AtBeginDocument {
    % longtable 宏包有另外的机制，需专门调整
    \@ifpackageloaded{longtable}{
      \setlength{\LTpre}{-0.8\baselineskip plus 0.2\baselineskip minus 0.2\baselineskip}
      \setlength{\LTpost}{0.1\baselineskip plus 0.2\baselineskip minus 0.2\baselineskip}
    }{}
  }
}
\__bithesis_if_graduate:TF {
  \tl_set:Nn \g__bithesis_label_divide_char_tl {.}
  % 研究生模板要求 "图序和图题间空1个中文字距"
  \captionsetup[figure]{font=small,labelsep=quad}
  % 研究生模板要求 "表序和题目间空1个中文字距"
  \captionsetup[table]{font=small,labelsep=quad}
  % 其它 caption 也参照上述格式
  \captionsetup[lstlisting]{font=small,labelsep=quad}
  \captionsetup[algorithm]{font=small,labelsep=quad}
} {
  \tl_set:Nn \g__bithesis_label_divide_char_tl {-}
  % 本科生模板无 caption 字距要求
  \captionsetup[figure]{font=small,labelsep=space}
  \captionsetup[table]{font=small,labelsep=space}
  \captionsetup[lstlisting]{font=small,labelsep=space}
  \captionsetup[algorithm]{font=small,labelsep=space}
}
\cs_set:Npn \thefigure {\thechapter\g__bithesis_label_divide_char_tl\arabic{figure}}

\cs_set:Npn \thetable {\thechapter\g__bithesis_label_divide_char_tl\arabic{table}}

\cs_set:Npn \theequation {\thechapter\g__bithesis_label_divide_char_tl\arabic{equation}}

\AtBeginDocument{
  \cs_gset:Npn \thelstlisting {\thechapter\g__bithesis_label_divide_char_tl\arabic{lstlisting}}
  \cs_gset:Npn \lstlistingname {\c__bithesis_label_code_tl}

  % 定义算法标题
  % 针对 algorithm 宏包
  \tl_set:Nn \ALG@name {\l__bithesis_misc_autoref_algo_tl}
  % 针对 algorithm2e 宏包
  \tl_set:Nn \algorithmcfname {\l__bithesis_misc_autoref_algo_tl}

  % 定义算法的 autoref
  % algorithm2e 宏包会覆写它，所以我们必须AtBeginDocument时再修改
  \tl_set:Nn \algorithmautorefname {\l__bithesis_misc_autoref_algo_tl}

  % 算法变成「章节号-序号」
  % 为了减少修改，我们只适配按章编号的情况。
  % 针对 algorithm 宏包
  \@ifpackagewith{algorithm}{chapter}{
    \cs_gset:Npn \thealgorithm
    {\thechapter\g__bithesis_label_divide_char_tl\arabic{algorithm}}
  }{}
  % 针对 algorithm2e 宏包
  \@ifpackagewith{algorithm2e}{algochapter}{
    % 名字中的“cf”是指其作者 Christophe Fiorio。
    \cs_gset:Npn \thealgocf
    {\thechapter\g__bithesis_label_divide_char_tl\arabic{algocf}}
  }{}

  % 默认的情况下，保留公式和上下文的一定间距。（会比 Word 稍宽一些）
  \setlength{\abovedisplayskip}{\l__bithesis_style_math_above_display_skip_dim}
  \setlength{\abovedisplayshortskip}{\l__bithesis_style_math_above_display_skip_dim}
  \setlength{\belowdisplayskip}{\l__bithesis_style_math_below_display_skip_dim}
  \setlength{\belowdisplayshortskip}{\l__bithesis_style_math_below_display_skip_dim}
  % 调整浮动体与文字之间的距离
  \addtolength{\intextsep}{\l__bithesis_misc_float_separation_tl\baselineskip}
  \addtolength{\textfloatsep}{\l__bithesis_misc_float_separation_tl\baselineskip}
  % longtable 宏包有另外的机制，需专门调整
  \@ifpackageloaded{longtable}{
    \addtolength{\LTpre}{\l__bithesis_misc_float_separation_tl\baselineskip}
    \addtolength{\LTpost}{\l__bithesis_misc_float_separation_tl\baselineskip}
  }{}
  % 调整算法与文字之间的距离
  % 针对 algorithm2e 宏包
  \@ifpackageloaded{algorithm2e}{
    % 宏包手册介绍可自定义宏，再`\SetAlgoSkip`；我们为简洁，直接覆写。
    \renewcommand{\@algoskip}{\vspace{\l__bithesis_misc_algorithm_separation_tl}}
  }{}
}
\bool_if:NF \l__bithesis_style_hyphen_bool {
  \hbadness=10000
  \tolerance=1
  \emergencystretch=\maxdimen
  \hyphenpenalty=10000
}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\lstdefinestyle{examplestyle}{
    backgroundcolor=\color{backcolour},
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2
}
\lstset{style=examplestyle}
\cs_set:Npn \listfigurename {\currentpdfbookmark{\c__bithesis_label_figure_tl}{ch:figures}\__bithesis_get_const:N {figure}}
\cs_set:Npn \listtablename {\currentpdfbookmark{\c__bithesis_label_table_tl}{ch:tables}\__bithesis_get_const:N {table}}
\theoremstyle{plain}
  \newtheorem{algo}{\__bithesis_get_const:N {algo}}[chapter]
  \newtheorem{them}{\__bithesis_get_const:N {them}}[chapter]
  \newtheorem{lem}{\__bithesis_get_const:N {lem}}[chapter]
  \newtheorem{prop}{\__bithesis_get_const:N {prop}}[chapter]
  \newtheorem{cor}{\__bithesis_get_const:N {cor}}[chapter]
  \newtheorem{axi}{\__bithesis_get_const:N {axi}}[chapter]
\theoremstyle{definition}
  \newtheorem{defn}{\__bithesis_get_const:N {defn}}[chapter]
  \newtheorem{conj}{\__bithesis_get_const:N {conj}}[chapter]
  \newtheorem{exmp}{\__bithesis_get_const:N {exmp}}[chapter]
  \newtheorem{case}{\__bithesis_get_const:N {case}}
\theoremstyle{remark}
  \newtheorem{rem}{\__bithesis_get_const:N {rem}}
  \renewcommand{\qedsymbol}{\ensuremath{\blacksquare}}
\cs_new:Npn \__bithesis_dunderline:nnn #1#2#3 {
  {\setbox0=\hbox{#3}\ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}}
}
\cs_new:Npn \__bithesis_dunderline:nn #1#2 {
  \__bithesis_dunderline:nnn {#1} {1pt} {#2}
}
\cs_new:Npn \__bithesis_dunderline:n #1 {
  \__bithesis_dunderline:nnn {-10pt} {1pt} {#1}
}
\newcommand\dunderline[3][-1pt]{{%
  \setbox0=\hbox{#3}
  \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}}}
\cs_new:Npn \__bithesis_render_cover_entry:nn #1#2 {
  \makebox[\l__bithesis_cover_label_max_width_dim][\l__bithesis_cover_label_align_tl]{
    \tl_if_blank:VTF #1 {} {#1\l__bithesis_cover_delimiter_tl}
  }
  \hspace{1ex}
  \__bithesis_dunderline:nnn{\l__bithesis_cover_underline_offset_dim}
    {\l__bithesis_cover_underline_thickness_dim}{
    \makebox[\l__bithesis_cover_value_max_width_dim][\l__bithesis_cover_value_align_tl]{#2}
  }\par
}
\cs_new:Npn \__bithesis_get_text_width:Nn #1#2
  {
    \hbox_set:Nn \l_tmpa_box {#2}
    \dim_set:Nn #1 { \box_wd:N \l_tmpa_box }
  }
\cs_generate_variant:Nn \__bithesis_get_text_width:Nn { NV }
\cs_new:Npn \__bithesis_get_max_text_width:NN #1#2
  {
    \group_begin:
      \seq_set_eq:NN \l__bithesis_tmpa_seq #2
      \dim_zero_new:N \l__bithesis_tmpa_dim
      \bool_until_do:nn { \seq_if_empty_p:N \l__bithesis_tmpa_seq }
        {
          \seq_pop_left:NN \l__bithesis_tmpa_seq \l__bithesis_tmpa_tl
          \__bithesis_get_text_width:NV \l__bithesis_tmpa_dim \l__bithesis_tmpa_tl
          \dim_gset:Nn #1 { \dim_max:nn {#1} { \l__bithesis_tmpa_dim } }
        }
    \group_end:
  }
\cs_new:Npn \__bithesis_parse_entry #1 #2 {
  \seq_set_split:Nnx \l__bithesis_tmp_right_seq {\\} {#2}
  \seq_clear:N \l__bithesis_tmp_left_seq
  \seq_map_inline:Nn \l__bithesis_tmp_right_seq {
    \seq_put_right:Nn \l__bithesis_tmp_left_seq {}
  }
  \seq_put_left:Nn \l__bithesis_tmp_left_seq {#1}
  \seq_pop_right:NN \l__bithesis_tmp_left_seq \g__bithesis_trashcan_tl
}
\cs_new:Npn \__bithesis_render_cover_entry:n #1 {
  % 左边是标签，右边是值。
  % 形如：
  % { {label_1} {value_1}, {label_2} {value 2} }
  % 首先转换成 seq 类型。
  \seq_set_from_clist:NN \l__bithesis_input_seq #1
  \seq_map_inline:Nn \l__bithesis_input_seq {
    % 然后对于每一对 label 和 value，首先查找
    % value 中是否含有 \\ 字符，如果有，则将其分割成多个
    % label - value 对。
    % 比如 {label_1} {value \\ 1} 会被转换成
    % { {label_1} {value}, {} {1} }
    \__bithesis_parse_entry ##1
    % 然后将这些 label - value 对添加到 \l__bithesis_right_seq
    % 或者 \l__bithesis_left_sql 中。
    % left 就是 label，right 就是 value。
    \seq_concat:NNN \l__bithesis_right_seq \l__bithesis_right_seq \l__bithesis_tmp_right_seq
    \seq_concat:NNN \l__bithesis_left_seq \l__bithesis_left_seq \l__bithesis_tmp_left_seq
  }

  % 如果用户选择自动计算最大宽度，则计算最大宽度。
  \bool_if:NT \l__bithesis_cover_auto_width_bool {
    \__bithesis_get_max_text_width:NN \l__bithesis_cover_label_max_width_dim \l__bithesis_left_seq
    \__bithesis_get_max_text_width:NN \l__bithesis_cover_value_max_width_dim \l__bithesis_right_seq
    % 在 value 两边加上空白，避免文本太靠边。
    \dim_add:Nn \l__bithesis_cover_value_max_width_dim { \l__bithesis_cover_auto_width_padding_dim * 2 }
  }

  % 最后，根据宽度渲染 label 和 value 对。
  \group_begin:
    \bool_until_do:nn { \seq_if_empty_p:N \l__bithesis_left_seq }
      {
        \seq_pop_left:NN \l__bithesis_left_seq \l__bithesis_tmpa_tl
        \seq_pop_left:NN \l__bithesis_right_seq \l__bithesis_tmpb_tl
        \tl_if_empty:xTF \l__bithesis_tmpb_tl {} {
          \__bithesis_render_cover_entry:nn {\l__bithesis_tmpa_tl} {\l__bithesis_tmpb_tl}
        }
      }
  \group_end:
}
\cs_new:Npn \make_graduate_cover: {
  \cleardoublepage
  \currentpdfbookmark{封面}{frontmatter:cover1}
  \begin{titlepage}
    {
      \heiti\zihao{5}
      \tl_if_blank:VTF \l__bithesis_value_classified_level_tl {} {
        \flushright
        \c__bithesis_label_classified_level_tl：~
        \l__bithesis_value_classified_level_tl \par
      }
    }
    \centering
    \vspace*{65mm}
    {\heiti\zihao{-2} \l__bithesis_value_title_tl}
    \vskip 60mm
    {
      % 渲染信息。
      \clist_set:Nn \l__bithesis_input_clist {
        {姓名：} {\__bithesis_secret_info:nn{\l__bithesis_value_author_tl}{\g__bithesis_const_substitute_symbol_tl\g__bithesis_const_substitute_symbol_tl\g__bithesis_const_substitute_symbol_tl}},
        {学号：} {\__bithesis_secret_info:N \l__bithesis_value_student_id_tl},
        {学院：} {\l__bithesis_value_school_tl},
      }
      \linespread{2.0}\selectfont
      % 黑体 小三
      \heiti \zihao{-3} \__bithesis_render_cover_entry:n \l__bithesis_input_clist
    }
    \vskip 10mm
    % 黑体 小三
    {\heiti \zihao{-3} \l__bithesis_cover_date_tl}
  \end{titlepage}
}
\msg_new:nnn { bithesis } { paper-back/missing-degree-type-icon-file }
  {
    Failed~to~find~the~file~for~degree~type~in~the~paper~back:~#1.\\
    Please~download~from~https://github.com/BITNP/BIThesis/blob/main/templates/graduate-thesis/ #1.
  }
\cs_new:Npn \make_paper_back: {
  \cleardoublepage
  \currentpdfbookmark{书脊}{frontmatter:paperback}
  \begin{titlepage}
    \centering
    % 实现竖排——将水平宽度设得很窄，让文字自动换行，并改小行距
    \linespread{1.1}\selectfont
    \begin{minipage}[c][19.7cm]{2em}
      \centering
      {
        \tl_new:N \l__bithesis_icon_path_tl
        \tl_set:Nx \l__bithesis_icon_path_tl { misc/icon_ \l__bithesis_value_degree_type_tl .jpg }
        \file_if_exist:nTF {\l__bithesis_icon_path_tl} {
          \includegraphics[width=1.5em]{\l__bithesis_icon_path_tl}
        } {
          \msg_warning:nnV {bithesis} {paper-back/missing-degree-type-icon-file} {\l__bithesis_icon_path_tl}
        }
      }
      \vspace{1em plus 1fill}
      \par
      {
        \heiti\zihao{3}
        \tl_if_blank:VTF \l__bithesis_value_vertical_title_tl
          {\l__bithesis_value_title_tl}{\l__bithesis_value_vertical_title_tl}
      }
      \par
      \vspace{1em plus 1fill}
      {\heiti\zihao{3}\__bithesis_secret_info:nn{\l__bithesis_value_author_tl}{\g__bithesis_const_substitute_symbol_tl\quad\g__bithesis_const_substitute_symbol_tl\quad\g__bithesis_const_substitute_symbol_tl}}
      \par
      \vspace{1em plus 1fill}
      {\heiti\zihao{3}\c__bithesis_label_university_tl}
    \end{minipage}
  \end{titlepage}
}
\cs_new:Npn \__bithesis_make_chinese_title_page: {
  \cleardoublepage
  \currentpdfbookmark{中文题名页}{frontmatter:titlepage}
  \begin{titlepage}
      \begin{minipage}[t]{0.48\textwidth}
        % 密级、分类号
        {\heiti \zihao{5} \noindent \c__bithesis_label_classification_tl}
        \l__bithesis_value_classification_tl\\
        {\heiti \zihao{5} \c__bithesis_label_udc_tl}  \l__bithesis_value_udc_tl
      \end{minipage}

      \hfill

      % 以下内容是「学生类型」的内容，
      % 在没有勾选的时候隐藏。
      \bool_if:nT {\l__bithesis_cover_show_special_type_box_bool || \l__bithesis_value_international_student_ugp_bool || \l__bithesis_value_cross_research_bool || \l__bithesis_value_engineering_special_plan_bool} {
        \begin{minipage}[t]{0.48\textwidth}
          \vspace{-12pt}
          \begin{flushright}
          \setlength\fboxrule{1pt}\setlength\fboxsep{3mm}
          \fbox{
            \noindent\begin{minipage}{0.48\linewidth}
              \heiti \zihao{-4}
              \scalebox{1.1}\BigStar{}\hspace{4pt} \c__bithesis_label_special_type_tl\\

              {
                \zihao{4}
                \bool_if:NTF \l__bithesis_value_engineering_special_plan_bool {\boxcheck:} {\boxempty:}
              }
              \hspace{1pt}\c__bithesis_label_engineering_special_plan_tl\\

              {
                \zihao{4}
                \bool_if:NTF \l__bithesis_value_cross_research_bool {\boxcheck:} {\boxempty:}
              }
              \hspace{1pt}\c__bithesis_label_cross_research_tl\\

              {
                \zihao{4}
                \bool_if:NTF \l__bithesis_value_international_student_ugp_bool {\boxcheck:} {\boxempty:}
              }
              \hspace{1pt}\c__bithesis_label_international_student_ugp_tl
            \end{minipage}
          }
          \end{flushright}
        \end{minipage}
        % 保证下面的内容空间不会受到挤占。
        \vspace{-35pt}
      }

     \begin{center}

      \vskip \stretch{1}

         {\heiti\zihao{-2} \l__bithesis_value_title_tl}

      \vskip \stretch{1}

      \def\tabcolsep{1pt}
      \def\arraystretch{1.5}

      {
        \renewcommand{\baselinestretch}{2}

        \tl_if_empty:NT \l__bithesis_cover_delimiter_tl {
          \tl_set:Nn \l__bithesis_cover_delimiter_tl {\qquad}
        }
        \tl_set:Nn \l__bithesis_cover_underline_offset_dim {-5pt}

        % 如果不是自动计算宽度，且用户没有自定义宽度，
        % 则尝试提供一个默认宽度。
        \bool_if:NF \l__bithesis_cover_auto_width_bool {
          \dim_compare:nNnT {\l__bithesis_cover_label_max_width_dim} = {0pt} {
            \dim_set:Nn \l__bithesis_cover_label_max_width_dim {45mm}
          }
          \dim_compare:nNnT {\l__bithesis_cover_value_max_width_dim} = {0pt} {
            \dim_set:Nn \l__bithesis_cover_value_max_width_dim {60mm}
          }
        }

        % 渲染信息。
        \clist_set:Nn \l__bithesis_input_clist {
            {\c__bithesis_graduate_label_author_tl} {\__bithesis_secret_info:nn{\l__bithesis_value_author_tl}{\g__bithesis_const_substitute_symbol_tl\g__bithesis_const_substitute_symbol_tl\g__bithesis_const_substitute_symbol_tl}},
            {\c__bithesis_graduate_label_school_tl} {\l__bithesis_value_school_tl},
            {\c__bithesis_graduate_label_supervisor_tl} {\__bithesis_secret_info:N{\l__bithesis_value_supervisor_tl}},
            {\c__bithesis_graduate_label_industrial_mentor_tl} {\__bithesis_secret_info:N{\l__bithesis_value_industrial_mentor_tl}},
            {\c__bithesis_graduate_label_chairman_tl} {\__bithesis_secret_info:N{\l__bithesis_value_chairman_tl}},
            {\g__bithesis_const_info_degree_tl} {\l__bithesis_value_degree_tl},
            {\g__bithesis_const_info_major_tl} {\l__bithesis_value_major_tl},
            {\c__bithesis_graduate_label_institute_tl} {\l__bithesis_value_institute_tl},
            {\c__bithesis_graduate_label_defense_date_tl} {\l__bithesis_value_defense_date_tl},
         }

        \heiti\zihao{-3}
        \__bithesis_render_cover_entry:n \l__bithesis_input_clist
      }
    \end{center}
    \vskip \stretch{0.5}
  \end{titlepage}
}
\cs_new:Npn \__bithesis_make_english_title_page: {
  \currentpdfbookmark{英文题名页}{frontmatter:titlepageen}
  \begin{titlepage}
    \begin{center}

    \vspace*{10em}

    {
      \zihao{-2}
      \textbf{\l__bithesis_value_title_en_tl}
    }

    \vskip \stretch{1}

    {
      \tl_if_empty:NT \l__bithesis_cover_delimiter_tl {
        \tl_set:Nn \l__bithesis_cover_delimiter_tl {:~}
      }

      \tl_set:Nn \l__bithesis_cover_label_align_tl {l}
      \tl_set:Nn \l__bithesis_cover_underline_offset_dim {-5pt}

      % 如果不是自动计算宽度，且用户没有自定义宽度，
      % 则尝试提供一个默认宽度。
      \bool_if:NF \l__bithesis_cover_auto_width_bool {
        \dim_compare:nNnT {\l__bithesis_cover_label_max_width_dim} = {0pt} {
          \dim_set:Nn \l__bithesis_cover_label_max_width_dim {55mm}
        }
        \dim_compare:nNnT {\l__bithesis_cover_value_max_width_dim} = {0pt} {
          \dim_set:Nn \l__bithesis_cover_value_max_width_dim {85mm}
        }
      }

      % 渲染信息。
      \clist_set:Nn \l__bithesis_input_clist {
          {\c__bithesis_graduate_label_author_en_tl} {\__bithesis_secret_info:N{\l__bithesis_value_author_en_tl}},
          {\c__bithesis_graduate_label_school_en_tl} {\l__bithesis_value_school_en_tl},
          {\c__bithesis_graduate_label_supervisor_en_tl} {\__bithesis_secret_info:N{\l__bithesis_value_supervisor_en_tl}},
          {\c__bithesis_graduate_label_industrial_mentor_en_tl} {\__bithesis_secret_info:N{\l__bithesis_value_industrial_mentor_en_tl}},
          {\c__bithesis_graduate_label_chairman_en_tl} {\__bithesis_secret_info:N{\l__bithesis_value_chairman_en_tl}},
          {\c__bithesis_graduate_label_degree_en_tl} {\l__bithesis_value_degree_en_tl},
          {\c__bithesis_graduate_label_major_en_tl} {\l__bithesis_value_major_en_tl},
          {\c__bithesis_graduate_label_institute_en_tl} {\l__bithesis_value_institute_en_tl},
          {\c__bithesis_graduate_label_defense_date_en_tl} {\l__bithesis_value_defense_date_en_tl},
       }

      \zihao{-3}
      \__bithesis_render_cover_entry:n \l__bithesis_input_clist
    }

    \end{center}

    \vskip \stretch{0.5}
  \end{titlepage}
}
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
  {\node[shape = circle, draw, inner~sep = 1pt]
  (char) {\phantom{\ifblank{#1}{#2}{#1}}};
  \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}
\cs_new:Npn \__bithesis_graduate_originality:
  {
    % 取消页眉页脚。
    \ctexset {
      chapter / pagestyle = plain,
    }

    \begin{titlepage}
      % 不计算页码。
      \pagenumbering{gobble}

      % 原创性声明部分
      \begin{center}
        \__bithesis_same_page:
        \ctexset{
          chapter = {
            titleformat = {\heiti\zihao{-2}},
          }
        }
        \currentpdfbookmark{\c__bithesis_graduate_label_originality_tl}{frontmatter:originality}
        \chapter*{
          \c__bithesis_graduate_label_originality_tl
        }
      \end{center}

      % 本部分字号为三号。
      \zihao{3}
      \qquad\c__bithesis_graduate_label_originality_clause_tl
      \vspace{3\baselineskip}

      \begin{flushright}
        \c__bithesis_graduate_label_originality_author_signature_tl\par
      \end{flushright}

      \vspace{3\baselineskip}

      % 使用授权声明部分。
      \begin{center}
        \__bithesis_same_page:
        \ctexset{
          chapter = {
            titleformat = {\heiti\zihao{-2}},
          }
        }
        \currentpdfbookmark{\c__bithesis_graduate_label_authorization_tl}{frontmatter:originality1}
        \chapter*{
          \c__bithesis_graduate_label_authorization_tl
        }
      \end{center}

      \qquad\c__bithesis_graduate_label_authorization_clause_tl

      \vspace*{15mm}

      \begin{flushright}
        \begin{spacing}{1.65}
          \zihao{3}
          % \hspace{5mm}\raisebox{-2ex}{\includegraphics[width=30mm]{example-image}}\hspace{5mm}
          \c__bithesis_graduate_label_originality_author_signature_tl\par
          \vspace{1\baselineskip}
          \c__bithesis_graduate_label_originality_supervisor_signature_tl\par
        \end{spacing}
      \end{flushright}
    \end{titlepage}
    \cleardoublepage
  }
\DeclareDocumentCommand \BITSetup { m }
  {
    \keys_set:nn { bithesis } { #1 }
    \__bithesis_resolve_auto_values:
  }
\DeclareDocumentCommand \BigStar { }
  { \ding{72} }
  \NewDocumentEnvironment {blindPeerReview} {O{\c_true_bool} +b}
  {
    \bool_if:nTF {\g__bithesis_blind_mode_bool && #1} {} {
      #2
    }
  } {}
\RenewDocumentCommand \cleardoublepage { }
  {
    \clearpage
    \bool_if:NT \g__bithesis_twoside_bool
      {
        \int_if_odd:nF \c@page
          { \hbox:n { } \thispagestyle { empty } \newpage }
      }
  }
\DeclareDocumentCommand \SecretInfo { m o }
  {
    \IfValueTF {#2} {
      \__bithesis_secret_info:nn {#1} {#2}
    } {
      \__bithesis_secret_info:n {#1}
    }
  }
\DeclareDocumentCommand \MakeCover {}
  {
    \begin{blindPeerReview}[\l__bithesis_cover_hide_cover_in_peer_review_bool]
    \group_begin:

    % 封面使用的 thesis-type 可能与整体不同。
    \int_new:N \l__bithesis_thesis_type_int
    \bool_if:NTF \l__bithesis_cover_prefer_zh_bool {
      \int_set:Nn \l__bithesis_thesis_type_int {1}
    } {
      \int_set:Nn \l__bithesis_thesis_type_int \g__bithesis_thesis_type_int
    }

    \int_case:nn {\l__bithesis_thesis_type_int}
    {
      {1}
      {
        \currentpdfbookmark{封面}{frontmatter:cover}
        \begin{titlepage}
          \vspace*{16mm}

          \centering

          \tl_if_blank:VTF \l_bit_coverheaderimage_tl {} {
            \includegraphics[width=9.87cm]{\l_bit_coverheaderimage_tl}\\
          }

          \vspace*{-3mm}

          \zihao{-0}\textbf{\ziju{0.12}\songti{\l__bithesis_style_headline_tl}}\par

          \vspace{0.5em plus 1fill}

          \group_begin:
          % 中文标题
          \tl_set:Nn \l_tmpa_tl {
            \linespread{1.46}\selectfont
            \zihao{2}\textbf{\xihei:n \l__bithesis_value_title_tl}\par
          }
          % 英文标题
          \tl_set:Nn \l_tmpb_tl {
            \linespread{1.65}\selectfont
            \zihao{3}\textbf{\l__bithesis_value_title_en_tl}\par
          }

          \bool_if:NTF \l__bithesis_cover_reverse_titles_bool {
            \l_tmpb_tl \vspace{3mm} \l_tmpa_tl
          } {
            \l_tmpa_tl \vspace{3mm} \l_tmpb_tl
          }
          \group_end:

          \vspace{0em plus 1fill}

          \begin{spacing}{1.8}
            \begin{center}
            \tl_if_empty:NT \l__bithesis_cover_delimiter_tl {
              \tl_set:Nn \l__bithesis_cover_delimiter_tl {：}
            }
            % if not auto width, try override width
            \bool_if:NF \l__bithesis_cover_auto_width_bool {
              \dim_compare:nNnT {\l__bithesis_cover_label_max_width_dim} = {0pt} {
                \dim_set:Nn \l__bithesis_cover_label_max_width_dim {35mm}
              }
              \dim_compare:nNnT {\l__bithesis_cover_value_max_width_dim} = {0pt} {
                \dim_set:Nn \l__bithesis_cover_value_max_width_dim {78mm}
              }
            }

            \clist_set:Nn \l__bithesis_input_clist {
              {\c__bithesis_label_semester_tl} {\l__bithesis_value_semester_tl},
              {\c__bithesis_label_school_tl} {\l__bithesis_value_school_tl},
              {\g__bithesis_const_info_major_tl} {\l__bithesis_value_major_tl},
              {\c__bithesis_label_class_tl} {\__bithesis_secret_info:N \l__bithesis_value_class_tl},
              {\c__bithesis_label_author_tl} {\__bithesis_secret_info:N \l__bithesis_value_author_tl},
              {\c__bithesis_label_student_id_tl} {\__bithesis_secret_info:N \l__bithesis_value_student_id_tl},
              {\c__bithesis_label_course_tl} {\l__bithesis_value_course_tl},
              {\c__bithesis_label_supervisor_tl} {\__bithesis_secret_info:N \l__bithesis_value_supervisor_tl},
              {\c__bithesis_label_co_supervisor_tl} {\__bithesis_secret_info:N \l__bithesis_value_external_supervisor_tl},
              {\c__bithesis_label_teacher_tl} {\l__bithesis_value_teacher_tl},
            }

            \zihao{3}

            \__bithesis_render_cover_entry:n \l__bithesis_input_clist

            \end{center}
          \end{spacing}

          \vspace*{1.5em plus 1.5fill}
          \centering
          \zihao{3}\ziju{0.5}\songti{
            \tl_if_empty:NTF \l__bithesis_cover_date_tl {
              % 英文模板中 ctex 不会预设日期格式，但仍要保证中文封面的日期按中文习惯
              \ctexset{today=small}
              \today
            } {
              \l__bithesis_cover_date_tl
            }
          }
        \end{titlepage}
      }
      {2}
      {
        \begin{titlepage}
          \centering

          \tl_if_blank:VTF \l_bit_coverheaderimage_tl {} {
            \includegraphics[width=6.87cm]{\l_bit_coverheaderimage_tl}\\
          }

          \vspace{1.2mm}

          \zihao{2}\textbf{\songti{\l__bithesis_style_headline_tl}}

          % 外文翻译封面有两组中英文标题，行数变化范围大，因此采用 fill 比例布局
          \vspace{\stretch{1}}

          {

          \begin{spacing}{1.8}

            \tl_set:Nn \l__bithesis_cover_delimiter_tl {\textbf{：}}
            \bool_set_false:N \l__bithesis_cover_auto_width_bool
            \dim_set:Nn \l__bithesis_cover_label_max_width_dim {35mm}
            \dim_set:Nn \l__bithesis_cover_value_max_width_dim {115mm}

            \clist_set:Nn \l__bithesis_input_clist {
              {\songti\zihao{4}\textbf{外文原文题目}} {\l__bithesis_value_trans_origin_title_tl},
              {\songti\zihao{4}\textbf{中文翻译题目}} {\l__bithesis_value_trans_title_tl},
            }

            \zihao{-3}
            \centering

            \__bithesis_render_cover_entry:n \l__bithesis_input_clist

          \end{spacing}

          }

          \vspace{\stretch{1}}

          \zihao{2}\textbf{\xihei:n \l__bithesis_value_title_tl}\par

          \vspace{3mm}

          \begin{spacing}{1.2}
            \zihao{3}\selectfont{\textbf{\l__bithesis_value_title_en_tl}}\par
          \end{spacing}

          \vspace{\stretch{0.67}}

          \begin{spacing}{1.8}
            \tl_if_empty:NT \l__bithesis_cover_delimiter_tl {
              \tl_set:Nn \l__bithesis_cover_delimiter_tl {：}
            }

            % 如果不是自动计算宽度，且用户没有自定义宽度，
            % 则尝试提供一个默认宽度。
            \bool_if:NF \l__bithesis_cover_auto_width_bool {
              \dim_compare:nNnT {\l__bithesis_cover_label_max_width_dim} = {0pt} {
                \dim_set:Nn \l__bithesis_cover_label_max_width_dim {35mm}
              }
              \dim_compare:nNnT {\l__bithesis_cover_value_max_width_dim} = {0pt} {
                \dim_set:Nn \l__bithesis_cover_value_max_width_dim {78mm}
              }
            }

            \zihao{3}

        % 渲染信息。
            \clist_set:Nn \l__bithesis_input_clist {
              {\c__bithesis_label_school_tl} {\l__bithesis_value_school_tl},
              {\c__bithesis_label_major_tl} {\l__bithesis_value_major_tl},
              {\c__bithesis_label_class_tl} {\__bithesis_secret_info:N \l__bithesis_value_class_tl},
              {\c__bithesis_label_author_tl} {\__bithesis_secret_info:N \l__bithesis_value_author_tl},
              {\c__bithesis_label_student_id_tl} {\__bithesis_secret_info:N \l__bithesis_value_student_id_tl},
              {\c__bithesis_label_supervisor_tl} {\__bithesis_secret_info:N \l__bithesis_value_supervisor_tl},
              {\c__bithesis_label_co_supervisor_tl} {\__bithesis_secret_info:N \l__bithesis_value_external_supervisor_tl},
            }

            \__bithesis_render_cover_entry:n \l__bithesis_input_clist

          \end{spacing}

          \vspace{\stretch{0.67}}
        \end{titlepage}
      }
      {3} {
        \begin{titlepage}
          \vspace*{16mm}

          \centering

          \tl_if_blank:VTF \l_bit_coverheaderimage_tl {} {
            \includegraphics[width=9.87cm]{\l_bit_coverheaderimage_tl}\\
          }

          \vspace*{-3mm}

          \zihao{1}\textbf{\ziju{0.12}\l__bithesis_style_headline_tl}\par

          \vspace{18mm}

          \bool_if:NT \l__bithesis_cover_add_titlezh_bool {
            \zihao{2}\textbf{\xihei:n \l__bithesis_value_title_tl}\par
            \vspace{16mm}
          }

          \zihao{2}\textbf{\xihei:n \l__bithesis_value_title_en_tl}\par

          \vspace{10mm}

          \begin{spacing}{1.8}
            \begin{center}
            \tl_if_empty:NT \l__bithesis_cover_delimiter_tl {
              \tl_set:Nn \l__bithesis_cover_delimiter_tl {:}
            }

            % if not auto width, try override width
            \bool_if:NF \l__bithesis_cover_auto_width_bool {
              \dim_compare:nNnT {\l__bithesis_cover_label_max_width_dim} = {0pt} {
                \dim_set:Nn \l__bithesis_cover_label_max_width_dim {20mm}
              }
              \dim_compare:nNnT {\l__bithesis_cover_value_max_width_dim} = {0pt} {
                \dim_set:Nn \l__bithesis_cover_value_max_width_dim {105mm}
              }
            }

            \zihao{4}

            \clist_set:Nn \l__bithesis_input_clist {
              {\c__bithesis_label_school_en_tl} {\l__bithesis_value_school_tl},
              {\g__bithesis_const_info_major_tl} {\l__bithesis_value_major_tl},
              {\c__bithesis_label_author_en_tl} {\l__bithesis_value_author_tl},
              {\c__bithesis_label_student_id_en_tl} {\l__bithesis_value_student_id_tl},
              {\c__bithesis_label_supervisor_en_tl} {\l__bithesis_value_supervisor_tl},
              {\c__bithesis_label_co_supervisor_en_tl} {\l__bithesis_value_external_supervisor_tl},
            }

            \__bithesis_render_cover_entry:n \l__bithesis_input_clist

            \end{center}
          \end{spacing}

          \vspace*{\fill}
          \centering
          \zihao{3}\ziju{0.5}\songti{
            \tl_if_empty:NTF \l__bithesis_cover_date_tl {
              \today
            } {
              \l__bithesis_cover_date_tl
            }
          }
        \end{titlepage}
      }
      {4} {
        \make_graduate_cover:
      }
      {5} {
        \make_graduate_cover:
      }
    }
    \group_end:
    \end{blindPeerReview}
  }
\NewDocumentCommand \MakeOriginality {}
  {
    \group_begin:
    \begin{blindPeerReview}[\l__bithesis_cover_hide_cover_in_peer_review_bool]
      \int_case:nn {\g__bithesis_thesis_type_int}
      {
        {1}
        {
          \currentpdfbookmark{声明}{frontmatter:originality}
          \pagestyle{BIThesis}
          \pagenumbering{gobble}

          % 原创性声明部分
          \begin{center}
            \vspace*{-2bp}
            \__bithesis_same_page:
            \chapter*{\heiti\zihao{2}\c__bithesis_bachelor_label_originality_tl}
          \end{center}~\par

          % 本部分字号为小三。
          \zihao{-3}
          \c__bithesis_bachelor_label_originality_clause_tl

          \vspace{17mm}

          \begin{flushright}
            \c__bithesis_bachelor_label_originality_author_signature_tl\par
          \end{flushright}

          \vspace{16mm}

          % 使用授权声明部分
          \begin{center}
            \__bithesis_same_page:
            \chapter*{
              \heiti\zihao{2}
              \c__bithesis_bachelor_label_authorization_tl
            }
          \end{center}~\par

          \c__bithesis_bachelor_label_authorization_clause_tl

          \vspace*{3mm}

          \begin{flushright}
            \begin{spacing}{1.65}
              \zihao{-3}
              % \hspace{5mm}\raisebox{-2ex}{\includegraphics[width=30mm]{example-image}}\hspace{5mm}
              \c__bithesis_bachelor_label_originality_author_signature_tl\par
              \c__bithesis_bachelor_label_originality_supervisor_signature_tl\par
            \end{spacing}
          \end{flushright}

          \newpage
        }
        {3} {
          \currentpdfbookmark{Statements}{frontmatter:originality}
          \pagestyle{BIThesis}
          \pagenumbering{gobble}

          % 原创性声明部分
          \begin{center}
            \vspace*{-2bp}
            \__bithesis_same_page:
            \chapter*{
              \heiti\zihao{-2}
              \c__bithesis_bachelor_english_label_originality_tl
            }
          \end{center}~\par

          % 本部分字号为小四
          \zihao{-4}
          \c__bithesis_bachelor_english_label_originality_clause_tl

          \bigbreak

          Student~(Signature):~\dunderline[-1pt]{1pt}{\makebox[18mm]{}}~Date:\par

          \vspace{\stretch{1}}

          % 使用授权声明部分
          \begin{center}
            \__bithesis_same_page:
            \chapter*{
              \heiti\zihao{-2}
              \c__bithesis_bachelor_english_label_authorization_tl
            }
          \end{center}~\par

          \c__bithesis_bachelor_english_label_authorization_clause_tl

          \bigbreak
          Student~(Signature):~
            \dunderline[-1pt]{1pt}{\makebox[18mm + 16bp]{}}~
            \hspace{2mm}Date:\par
          Supervisor~(Signature):~
            \dunderline[-1pt]{1pt}{\makebox[18mm]{}}~
            \hspace{2mm}Date:\par
        }
        {4} {\__bithesis_graduate_originality:}
        {5} {\__bithesis_graduate_originality:}
      }
    % 单独成页
    \clearpage
    \end{blindPeerReview}
    \group_end:
  }
\NewDocumentCommand \MakePaperBack {}
  {
    % 上下各留出规定的边距，到下一页再恢复。
    % 若标题超长，自然会向上下溢出。
    %
    % 必须在顶层操作，不然影响不确定。
    % https://tex.stackexchange.com/q/718581
    %
    % 单纯`\newgeometry`再`\restoregeometry`相当于仅仅`\clearpage`，也无问题。
    \newgeometry{
      vmargin = 5cm,
    }
    \begin{blindPeerReview}[\l__bithesis_cover_hide_cover_in_peer_review_bool]
      \make_paper_back:
    \end{blindPeerReview}
    \restoregeometry
  }
\NewDocumentCommand \MakeTitle {}
  {
    \begin{blindPeerReview}[\l__bithesis_cover_hide_cover_in_peer_review_bool]
      \__bithesis_make_chinese_title_page:
      \__bithesis_make_english_title_page:
    \end{blindPeerReview}
  }
\DeclareDocumentCommand \MakeTOC {}
  {
    {
      \__bithesis_if_bachelor_thesis:TF {
        \renewcommand{\baselinestretch}{1.35}
      } {
        \renewcommand{\baselinestretch}{1.56}
      }

      % 自定义目录样式
      \cs_set:Npn \contentsname {
        \fontsize{16pt}{\baselineskip}
        \l__bithesis_unnumchapter_style_cs:n
          \l__bithesis_title_font_cs:n
            {\l__bithesis_toc_title_tl}
        \vspace{-8pt}
      }

      \bool_if:NTF \l__bithesis_add_toc_to_toc_bool {
        % 添加「目录」本身到目录中，同时自动添加书签
        % 此处必须有`\phantomsection`，不然 hyperref 会把链接指向之前摘要的标题。
        \phantomsection
        \addcontentsline{toc}{chapter}{\c__bithesis_label_toc_en_tl}
      } {
        % 手动添加目录书签
        \currentpdfbookmark{\l__bithesis_toc_title_tl}{ch:toc}
      }

      % 制作目录
      \tableofcontents

      % 单独成页
      \clearpage
    }
  }
\NewDocumentEnvironment {abstract} {}
  {

    \cleardoublepage
    \linespread{1.53}\selectfont

    % 本科模板在标题「摘要」二字上方另有毕业设计题目
    \__bithesis_if_bachelor_thesis:T {
      \begin{center}
        \vspace*{-17bp}
        \heiti\zihao{-2}\textbf{
          \int_case:nn {\g__bithesis_thesis_type_int}
          {
            {1} {\l__bithesis_value_title_tl}
            {2} {\l__bithesis_value_trans_title_tl}
            {3} {\l__bithesis_value_title_tl}
          }
        }
      \end{center}

      \vspace*{2mm}
    }

    \ctexset{
      chapter/numbering = false,
    }

    \__bithesis_if_bachelor_thesis:T {
      \ctexset{
        chapter/titleformat = {\textmd}
      }
    }

    % 微调硕博模板标题上下的间距
    \__bithesis_if_graduate:T { \ctexset{ chapter = {
      beforeskip = 13bp,
      afterskip = 24bp,
    } } }

    {
      \__bithesis_same_page:
      \bool_if:NTF \l__bithesis_add_abstract_to_toc_bool {
        \chapter{\c__bithesis_label_abstract_tl}
      } {
        \currentpdfbookmark{\c__bithesis_label_abstract_tl}{ch:abstract}
        \chapter*{\c__bithesis_label_abstract_tl}
      }
    }
    \vspace*{1mm}
    \par
  }
  {
    \par
    \vspace{4ex}
    \noindent
    \__bithesis_if_graduate:TF {
      % 研究生模板中，“关键词”宋体小四加粗
      % 关键词为宋体小四号字。
      \textbf{\c__bithesis_label_keywords_tl}\l__bithesis_value_keywords_tl\par
    } {
      % 本科生模板中，关键词为黑体加粗
      \textbf{\heiti \c__bithesis_label_keywords_tl \l__bithesis_value_keywords_tl}\par
    }
    \newpage
  }
\NewDocumentEnvironment {abstractEn} {}
  {
    \linespread{1.53}\selectfont

    \__bithesis_if_bachelor_thesis:T {
      \begin{spacing}{0.95}
        \centering
        \vspace*{-2bp}

        \l__bithesis_title_font_cs:n {
          \zihao{3}\textbf
          \l__bithesis_value_title_en_tl\\
        }
      \end{spacing}
      \vspace*{10mm}
    }

    \ctexset{
      chapter/numbering = false,
    }

    \__bithesis_if_bachelor_thesis:TF {
      \ctexset{
        chapter/titleformat = {\zihao{-3}\textmd}
      }
    } {
      \ctexset {
        chapter/titleformat = {\heiti\zihao{3}\centering\textbf}
      }
    }

    % 微调硕博模板标题上下的间距
    \__bithesis_if_graduate:T { \ctexset{ chapter = {
      beforeskip = 19bp,
      afterskip = 35bp,
    } } }

    {
      \__bithesis_same_page:
      \bool_if:nTF {\l__bithesis_add_abstract_en_to_toc_bool} {
        \chapter{\c__bithesis_label_abstract_en_tl}
      } {
        \currentpdfbookmark{\c__bithesis_label_abstract_en_tl}{ch:abstract:en}
        \chapter*{\c__bithesis_label_abstract_en_tl}
      }
    }
  }
  {
    \par\vspace{3ex}\noindent
    \__bithesis_if_graduate:TF {
      % Times New Roman小四号字，行距22磅
      % “Key Words”
      % Times New Roman小四号字加粗
      \textbf{\c__bithesis_label_keywords_en_tl} \l__bithesis_value_keywords_en_tl
    } {
      \textbf{\c__bithesis_label_keywords_en_tl \l__bithesis_value_keywords_en_tl}
    }
    \newpage
  }

\NewDocumentEnvironment {conclusion} {}
  {
    \ctexset{
      section/number = \arabic{section}
    }

    \__bithesis_if_thesis_english:TF {
      \chapter{\c__bithesis_label_conclusion_en_tl}
    } {
      \chapter{\c__bithesis_label_conclusion_tl}
    }
  }
  {}
\NewDocumentEnvironment {bibprint} {}
  {
    % 设置参考文献字号为 5 号
    \renewcommand*{\bibfont}{\zihao{5}}
    % 设置参考文献各个项目之间的垂直距离为 0
    \setlength{\bibitemsep}{0ex}
    \setlength{\bibnamesep}{0ex}
    \setlength{\bibinitsep}{0ex}
    \__bithesis_if_graduate:TF {
    } {
      % 「本科生」设置单倍行距
      \renewcommand{\baselinestretch}{1.2}
    }
    % 设置参考文献顺序标签 `[1]` 与文献内容 `作者. 文献标题...` 的间距
    \setlength{\biblabelsep}{1.7mm}

    \bool_if:NF \l__bithesis_style_bibliography_indent_bool {
      % 设置参考文献后文缩进为 0（与 Word 模板保持一致）
      % See: https://github.com/hushidong/biblatex-gb7714-2015
      %      如何修参考文献表的缩进？
      \cs_set:Npn \itemcmd {
        \settowidth{\lengthid}{\mkgbnumlabel{\printfield{labelnumber}}}
        %%这里是所做的调整，以下两句通过调整\lengthid来调整缩进
        \setlength{\lengthid}{0pt}
        \addtolength{\lengthid}{-\biblabelsep}
        \setlength{\lengthlw}{\textwidth}
        \addtolength{\lengthlw}{-\lengthid}
        \addvspace{\bibitemsep}%恢复\bibitemsep的作用
        \hangindent\lengthid
        \leavevmode\mkgbnumlabel{\printfield{labelnumber}}%
        \hspace{\biblabelsep}
      }
    }

    \__bithesis_if_thesis_english:TF {
      \chapter{\c__bithesis_label_reference_en_tl}
    } {
      \chapter{\c__bithesis_label_reference_tl}
    }
  }
  {}
\NewDocumentEnvironment {appendices} {}
  {
    % Used in chapter, ToC.
    \tl_new:N \l__bithesis_appendix_plain_label_tl
    % Used before reference label.
    \tl_new:N \l__bithesis_appendix_default_title_tl

    \__bithesis_if_thesis_english:TF {
      \tl_set:Nn \l__bithesis_appendix_plain_label_tl {\c__bithesis_label_appendix_prefix_en_tl}
      \tl_set:Nn \l__bithesis_appendix_default_title_tl {\c__bithesis_label_appendix_en_tl}
    } {
      \tl_set:Nn \l__bithesis_appendix_plain_label_tl {\c__bithesis_label_appendix_prefix_tl}
      \tl_set:Nn \l__bithesis_appendix_default_title_tl {\c__bithesis_label_appendix_tl}
    }

    \bool_if:NTF \l__bithesis_appendices_chapter_level_bool {
      % 使用以「chapter」为顶层的附录格式

      % 仅设置 \setcounter{chapter}{0} 时，pdf 目录会索引到正文章节。
      % 因此，需要使用 \appendix 重置计数器，并将附录后面的
      % 几个章节视为特殊的附录页。
      \appendix

      \ctexset{
        chapter/numbering = true,
        chapter/name = {},
        chapter/number = \l__bithesis_appendix_plain_label_tl\hspace{1ex}\Alph{chapter},
        section/number = \Alph{chapter}. \arabic{section},
        subsection/number = \Alph{chapter}. \arabic{section}. \arabic{subsection},
      }

      \cs_set:Npn \thechapter {
        \Alph{chapter}
      }
    } {
      % 使用以「section」为顶层的附录格式

      % 因为不需要用到 chapter counter, 所以直接加一即可。
      \stepcounter{chapter}
      \setcounter{section}{0}
      % （与上面方法至少用一个）
      % 需要让 section 在 pdf bookmark 中输出字母而不是数字。
      % 详见 hyperref 代码。
      \gdef\theHsection{\Alph{section}}

      % 定义 \thefigure 采用节而不是章
\cs_set:Npn \thefigure {\theHsection \g__bithesis_label_divide_char_tl\arabic{figure}}

      \ctexset{
        section/number = \l__bithesis_appendix_plain_label_tl\hspace{1ex}\Alph{section},
        subsection/number = \Alph{section}. \arabic{subsection},
      }

      \cs_gset:Npn \thechapter {
        \Alph{section}
      }
      % \gdef \thechapter{\Alph{section}}

      \tl_if_blank:VTF \l__bithesis_appendices_title_tl {
        \chapter{\l__bithesis_appendix_default_title_tl}
      } {
        \chapter*{\l__bithesis_appendices_title_tl}
        \stepcounter{chapter}
        \tl_if_blank:VTF \l__bithesis_appendix_toc_title_tl {
          \addcontentsline{toc}{chapter}{\l__bithesis_appendix_default_title_tl}
        } {
          \addcontentsline{toc}{chapter}{\l__bithesis_appendix_toc_title_tl}
        }
      }
    }
  }
  {
  }
\NewDocumentEnvironment {acknowledgements} {+b}
  {
    \begin{blindPeerReview}
      % 将此章节视为特殊的附录页，关闭附录编号，重定义 section 编号。
      % 不知为何，需要手动重置 section 计数器。
      \setcounter{section}{0}
      \ctexset{
        appendix/numbering = false,
        section/number = \arabic{section},
        subsection/number = \arabic{section}. \arabic{subsection},
        subsubsection/number = \arabic{section}. \arabic{subsection}. \arabic{subsubsection},
      }

      \chapter{\g__bithesis_const_heading_acknowledgements_tl}
      \__bithesis_if_graduate:TF {\fangsong}{}
      #1
    \end{blindPeerReview}
  } {}
\NewDocumentCommand \Author {O{1} o o}
  {
    \bool_if:NTF \g__bithesis_blind_mode_bool {
      % 盲审模式
      \IfValueTF {#3} {
        #3
      } {
        第\zhnumber{#1}作者
      }
    } {
      % 普通模式
      \IfValueTF {#2} {
        % 覆盖默认的 \author 命令
        #2
      } {
        % 默认采用作者姓名
        \l__bithesis_value_author_tl
      }
    }
  }

\NewDocumentCommand \AuthorEn {O{1} o o}
  {
    \bool_if:NTF \g__bithesis_blind_mode_bool {
      % 盲审模式
      \IfValueTF {#3} {
        #3
      } {
        \Ordinalstringnum{#1}~Author
      }
    } {
      % 普通模式
      \IfValueTF {#2} {
        % 覆盖默认的 \author 命令
        #2
      } {
        % 默认采用作者姓名
        \l__bithesis_value_author_en_tl
      }
    }
  }
\NewDocumentCommand \addpub {m} {
  \nocite{#1}
  \addtocategory{mypub}{#1}
}

\NewDocumentCommand \addpubs {m} {
  % apply a clist
  \clist_map_function:nN {#1} \addpub
}
\NewDocumentCommand \pubsection {s m} {
  {
    \par
    \IfBooleanF {#1} {
      % 自增计数器
      \stepcounter{pub}
    }
    % 设置小标题，暂时没有考虑英文模式
    \noindent
    \textbf{
      \heiti{
        \IfBooleanF {#1} {\zhnumber{\thepub}、}#2
      }
    }\par
  }
}
\NewDocumentEnvironment {publications} {+b}
  {
    % 同时设置 omit 以及 blindPeerReview 才能跳过此章节生成。
    \begin{blindPeerReview}[\l__bithesis_publications_omit_bool]
      % 将此章节视为特殊的附录页，关闭附录编号，重定义 section 编号。
      % 不知为何，需要手动重置 section 计数器。
      \setcounter{section}{0}
      \ctexset{
        appendix/numbering = false,
        section/number = \arabic{section},
        subsection/number = \arabic{section}. \arabic{subsection},
        subsubsection/number = \arabic{section}. \arabic{subsection}. \arabic{subsubsection},
      }
      % 设置参考文献字号为 5 号
      \renewcommand*{\bibfont}{\zihao{5}}
      % 设置参考文献各个项目之间的垂直距离为 0
      \setlength{\bibitemsep}{0ex}
      \setlength{\bibnamesep}{0ex}
      \setlength{\bibinitsep}{0ex}
      % 设置参考文献顺序标签 `[1]` 与文献内容 `作者. 文献标题...` 的间距
      \setlength{\biblabelsep}{1.7mm}

      \bool_if:NF \l__bithesis_style_bibliography_indent_bool {
        % 设置参考文献后文缩进为 0（与 Word 模板保持一致）
        % See: https://github.com/hushidong/biblatex-gb7714-2015
        %      如何修参考文献表的缩进？
        \cs_set:Npn \itemcmd {
          \settowidth{\lengthid}{\mkgbnumlabel{\printfield{labelnumber}}}
          %%这里是所做的调整，以下两句通过调整\lengthid来调整缩进
          \setlength{\lengthid}{0pt}
          \addtolength{\lengthid}{-\biblabelsep}
          \setlength{\lengthlw}{\textwidth}
          \addtolength{\lengthlw}{-\lengthid}
          \addvspace{\bibitemsep}%恢复\bibitemsep的作用
          \hangindent\lengthid
          \leavevmode\mkgbnumlabel{\printfield{labelnumber}}%
          \hspace{\biblabelsep}
        }
      }

      % If in blindPeerReview mode, omit delimiters in author field.
      \bool_if:NT \g__bithesis_blind_mode_bool {
        % 如果有多个作者，不修改此项的话，作者与标题之间会有逗号。
        \DeclareDelimFormat[bib,biblist]{finalnamedelim}{}
        % 如果自己不是第一个作者，不修改此项的话，会在最开始有逗号。
        \DeclareDelimFormat{multinamedelim}{}
        % 如果覆盖的是英文作者，不修改此项的话，会在最开始有空格。
        \DeclareDelimFormat{bibnamedelimd}{}

        % 如果作者太多而被截断，不修改的话，会多余逗号、“等”云云。
        % 被截断的充要条件：作者数量大于通过`\BITSetup`设置的`publications/maxbibnames`。
        % 故设置标点来去掉逗号，
        \DeclareDelimFormat[bib,biblist]{andothersdelim}{}
        % 并设置本地化字符串来去掉“等”。
        \setlocalbibstring{andothers}{}
        \setlocalbibstring{andotherscn}{}
        % 另外注意，我们仍尊重`maxbibnames`和`minbibnames`，保证若开盲审时显示作者，则关盲审时也正常。
      }

      % ===== 上方定义与「参考文献」部分相同

      % 中文姓名下，此部分不参与输出。
      \cs_set:Npn \mkbibnamegiven ##1 {
        \haspartannotation{myself}{
          \bool_if:NTF \g__bithesis_blind_mode_bool {
            % 盲审模式，不输出内容
          } {
            % 普通模式
            \textbf{##1}
          }
        }{
          \bool_if:NTF \g__bithesis_blind_mode_bool {
            % 盲审模式，不输出内容
          } {
            % 普通模式
            ##1
          }
        }
      }

      \cs_set:Npn \mkbibnamefamily ##1 {
        \haspartannotation{myself}{
          % 作者为自己
          \bool_if:NTF \g__bithesis_blind_mode_bool {
            % 盲审模式
            \getpartannotation{myself}
          } {
            % 普通模式
            \textbf{##1}
          }
        }{
          % 作者不是自己
          \bool_if:NTF \g__bithesis_blind_mode_bool {
            % 盲审模式，不输出
          } {
            % 普通模式
            ##1
          }
        }
      }

      \if_cs_exist:N \c@pub {
        % 重置计数器
        \setcounter{pub}{0}
      } \else: {
        % 设置计数器
        \newcounter{pub}
      } \fi:

      % 设置参考文献的排序
      \bool_if:NTF \l__bithesis_publications_sorting_bool {
        % Sorting by year, name, type.
        \newrefcontext[sorting=ynt]
      } {
        % Do not sort.
        \newrefcontext
      }

      % 根据 maxbibnames 的设置，覆盖 \blx@maxbibnames 选项，保证所有作者都能显示。
      \cs_set:Npn \blx@maxbibnames {
        \l__bithesis_publications_maxbibnames_int
      }

      % 根据 minbibnames 的设置，覆盖 \blx@minbibnames 选项，保证所有作者都能显示。
      \cs_set:Npn \blx@minbibnames {
        \l__bithesis_publications_minbibnames_int
      }

      \chapter{\__bithesis_get_const:N {publications}}
      #1
    \end{blindPeerReview}
  }
  {}
\NewDocumentEnvironment {resume} {+b}
  {
    \begin{blindPeerReview}
      % 将此章节视为特殊的附录页，关闭附录编号，重定义 section 编号。
      % 不知为何，需要手动重置 section 计数器。
      \setcounter{section}{0}
      \ctexset{
        appendix/numbering = false,
        section/number = \arabic{section},
        subsection/number = \arabic{section}. \arabic{subsection},
        subsubsection/number = \arabic{section}. \arabic{subsection}. \arabic{subsubsection},
      }
      \chapter{\__bithesis_get_const:N{resume}}
      #1
    \end{blindPeerReview}
  }
  {
  }

\NewDocumentEnvironment {symbols} {}
  {
    \bool_if:NTF \l__bithesis_add_symbols_to_toc_bool {
      \chapter{\__bithesis_get_const:N {symbols}}
    } {
      \chapter*{\__bithesis_get_const:N {symbols}}
      \currentpdfbookmark{\c__bithesis_label_symbols_tl}{ch:symbols}
    }
    \zihao{-4}
    \begin{itemize}[
      labelwidth=2.5cm,
      labelsep=0.5cm,
      leftmargin=3cm,
      itemindent=0cm,
      % 不再在两项之间增加额外的间距（1.5 倍的行间距已经够宽了）（未来可以提供一个接口以供用户手动设置间距）
      itemsep=-0.5ex,
    ]
    \cs_set:Npn \makelabel ##1 {##1\hfil}
  }
  {
    \end{itemize}

    % 单独一页
    \clearpage
  }
\endinput
%%
%% End of file `bithesis.cls'.
