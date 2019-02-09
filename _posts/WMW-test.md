---
title: Wilcoxon-Mann-White Test in R. An Example
tag: Wilcoxon-Mann-White, t-test, R, example
---

Here are some notes about using Wilcoxon-Mann-White Test in R. The example is basedon on a study comparing managers from public and civil society organizations, which I worked with my colleage [Edgar Ruvalcaba](https://scholar.google.com/citations?user=JPwGCXgAAAAJ&hl=en&oi=ao).

<u>When to use Wilcoxon-Mann-Whitney (WMW)?</u>

The means were compared using  Wilcoxon-Mann-Whitney (WMW) test for difference in means. The WMW test is preferred over the t-test for comparing the mean of two groups under data that is not paired (i.e. not before-after comparison) and not normally distributed. Under these circumstances, the WMW test has more power and efficiency than the t-test cite{fay-Proschan2010}. The values for the group civil society are relatively normally distribution, whereas the values for the group government are highly skewed towards the highest scores.

<u>When not to use Wilcoxon-Mann-Whitney (WMW)?</u>

<u>Useful references:</u>

- XX

*Measures.* We established an analytic strategy focuses on two dimensions: a) Open Government, and b) Citizen Participation. The assessments related to \textit{Open Government} are: 1) level of development of open government values; 2) level of importance of open government, and 3) level of success of open government. The assessment related to \textit{Citizen Participation} are: 1) level of success of citizen participation, and 2) level of citizen participation in public affairs, according to "IAP2's Public Participation Spectrum" The level of development of open government values was evaluated with the question "In the following topics: What level of development do you think the Government of Jalisco is?", which had four variations: 1) access to information, 2) citizen participation, 3) accountability, and 4) use of new technologies and innovation. The response scale ranged from 1, not developed at all, to 7, totally developed.

To assess the level of importance of open government, we asked "How important do you think open government is for the Government of Jalisco?" The response scale ranged from 1, not important at all, to 7, totally important.

Two concepts measure level of success, in both open government and citizen participation. To measure the level of success, we asked "What is your perception about the success of implementing open government actions in the State of Jalisco?" and "What is your perception about the success of implementing citizen participation actions in the State of Jalisco?" In both cases, the response scale ranged from 1, not successful at all, to 7, totally successful.

Finally, according to the "IAP2's Public Participation Spectrum" a scale is established to know the level of citizen participation in public affairs, the scale is progressive in relation to the impact of citizen participation in public decision-making. The levels of participation established by the spectrum are: 1) There is no consultation or participation, 2) Inform: the government releases information of its actions. 3) Consult: civil society is able to give opinions and be heard by government bodies. 4) Involve: there is a feedback dialogue between civil society and government. 5) Collaborate: there is a permanent dialogue in all phases of public policies, such as problem definition, design, implementation and evaluation. 6) Empower: the government gives power to develop public policies to civil society.



The article is available at XXX and you can download the data and all replication files from XXX.
