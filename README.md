# Data-Analysis-on-CLT-Rocking-Shear-Walls

<div class=WordSection1>

<p class=MsoTitleCxSpFirst><em><span style='font-size:20.0pt;font-family:"Calibri Light",sans-serif;
font-style:normal'>AMATH 582 Final: Data Analysis on CLT Rocking Shear Walls</span></em></p>

<div>

<p class=MsoTitleCxSpMiddle><em><span style='font-size:20.0pt;font-family:"Calibri Light",sans-serif;
font-style:normal'>Sarah Wichman, Chi-Pu (Tom) Lin, and Nicolette Lewis</span></em></p>

</div>

<div>

<p class=MsoTitleCxSpLast><em><span style='font-size:20.0pt;font-family:"Calibri Light",sans-serif;
font-style:normal'>March 19, 2020</span></em></p>

</div>

<div>

<h1><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>Abstract</span></em></h1>

</div>

<p class=MsoListParagraph><em><span style='font-style:normal'>Accelerometer data
from the NHERI TallWood test on a full-scale two-story shake table test on a timber
building was used to study the modal properties of the specimen. Many techniques
in data analysis were utilized including Gaussian ﬁlters, averaging ﬁlters, Fourier
transforms, spectrograms and SVDs. Using these techniques, investigations into
dynamical information about the specimen that hadn’t previously been explored were
completed.</span></em></p>

<div>

<h1><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>1
Introduction and Overview</span></em></h1>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>With the
development of engineered wood products such as cross laminated timber (CLT), tall
timber buildings are becoming feasible and oﬀer beneﬁts such as faster construction
and the use of sustainable building materials. It has also opened the door to creating
seismic resilient systems that sustain minor damage during large earthquakes. With
this in mind, the NHERI TallWood Project, funded by the National</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Science
Foundation, is developing a rocking CLT wall seismic force resisting system for
tall timber buildings. During the summer of 2017, the NHERI TallWood group tested
a full-scale two-story mass timber building (Fig. 1), with CLT post-tensioned
rocking walls as the lateral system at the NHERI Large High Performance Outdoor
Shake Table at the University of California, San Diego (UCSD). Extensive analysis
of the behavior of this specimen has been conducted to study how the building performed
and the potential for using timber to create a seismically resilient structure.
These previous studies have looked closely at the the overall displacements of the
structure and the movements of each individual component to study how susceptible
it is to damage [4], [1], and [6]. Limited work however has been conducted to study
the modal response of this specimen during the test. This report aims to ﬁll those
gaps and to look at the overall modal response of the structure by leveraging diﬀerent
data analysis technique (e.g.</span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Fourier
transform, spectrograms, and singular value decomposition).</span></em></p>

</div>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>The data used
in this report was obtained by Sarah Wichman (co-author of this report) and the
rest of the NHERI TallWood group [3]. All data is publicly available on the NHERI
DesignSafe cyberinfrastructre [5].</span></em></p>

<div>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>1.1
Test Setup</span></em></h2>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>Fig. 1 shows
the structure tested. The test specimen was two stories, each with a ﬂoor size of
20 feet x 58 feet. The ﬁrst ﬂoor was 12 feet tall and the second ﬂoor was 10
feet tall. The gravity loads were supported by columns, and the lateral loads were
resisted by two coupled rocking shear walls [6], see Fig. 1. The specimen was
constructed on the NHERI shake-table at UCSD and can simulate ground motions in
one direction. The</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>specimen
was constructed such that the ground motion would move in the direction parallel
to the rocking shear walls. A series of fourteen total earthquake ground motions
were used to test the specimen and in between the ground motions, white noise tests
were completed to obtain the (elastic) natural period of the building. Table 1 summarizes
all the tests and the order in which tests were completed. The tests are numbered
1-14 </span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

<div data-page-no=2 id=pf2>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
width=433 height=550 id="Picture 2" src="AMATH582_Final_MD_files/image001.jpg"></span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>(a) Photo</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>(b) Design
Conﬁguration</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>Figure 1:
Test Specimen [6]</span></em></p>

</div>

<p class=MsoNormal><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>and are labeled
based on the historic earthquake motion that they represent. The motions are also
denoted as service level earthquake (SLE), design based earthquake (DBE), and maximum
considered earthquake (MCE) these are indicators of the size of the earthquake.
MCE are the largest earthquakes and SLE are the smallest earthquakes. More information
about these earthquakes can be found in [6]. The white noise tests are denoted by
WN. Again, they were run before and after every ground motion. Periodically
during testing slight modiﬁcations to the structure were made, so white noise tests
were also conducted before and after these modiﬁcations which is why two white noise
tests sometimes happened right after each other as seen in the testing schedule.
These modiﬁcations will not be discussed or analyses in detail in this report. In
total there were 21 white noise tests.</span></em></p>

<p class=MsoListParagraphCxSpMiddle> <img width=311 height=629 id="Picture 41"
src="AMATH582_Final_MD_files/image002.png"></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>A total
of 357 instruments were used on the structure for data collection. In this report
only 24 of the acceleration sensors were used for the data processing. The sensors
used were all 4000A Silicon Mems accelerometers with a full range of 10G from measurement
specialties and had an accuracy of 5%. Ten of the accelerometers used were located
on the roof of the structure and another 10 were located on the ﬁrst ﬂoor. Fig.
2 shows an aerial view of the ﬂoors with the locations of each accelerometer and
their names labeled. Although the shake table only moved in one direction, at each
location there were accelerometers that measured movement in each of the horizontal
directions to capture any potential torsional eﬀects in the building. The ﬁnal four
accelerometers that were used for this report were located at the base of each
of the four shear walls and measured acceleration in the direction parallel to shaking.
These four accelerometers were assumed to measure the movement of the shake table
itself.</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><a
href="#pf4"></a></span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

<div data-page-no=4 id=pf4>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=495 height=546 id="Picture 4"
src="AMATH582_Final_MD_files/image003.jpg"></span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>(a) First
Floor (b) Roof</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Figure 2:
Aerial View of Accelerometer Locations and Names</span></em></p>

</div>

</div>

</div>

<div data-page-no=5 id=pf5>

<div>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>&nbsp;</span></em></p>

<div>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>1.2
Project Scope</span></em></h2>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>Due to the
size of the test from which this data was collected, there was a lot of noise that
appeared in the data. In order to begin data processing, all the acceleration data
was ﬁrst ﬁltered using Gaussian ﬁlters in order to get more clear results. Both
a high-pass and a low-pass ﬁlter were applied to the data. This processed data was
then used for all the analyses discussed in this report. As mentioned previously,
White noise ground motions were used to excite the structure in order to capture
the natural frequencies of the structure after each test/modiﬁcation. The data obtained
from the accelerometers were analyzed using Fourier transform to compute the dominate
frequencies. The data was</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>ﬁltered
through (1) Gaussian ﬁlter on the spectral content, and (2) averaging the spectral
content from all the pertinent sensors. The natural frequencies of the ﬁrst and
second mode were computed. Moreover, the change in the frequencies due to the diﬀerent
tests/modiﬁcations was also explored. Spectrograms were computed from accelerometer
data from the structure excited by earthquake ground motions. This allowed the evolution
of the frequency content to be visualized. The spectrogram also allows for comparison
between low frequency and high frequency with respect to time and intensity of ground
shaking. </span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>In addition,
a modal analysis study was conducted on the overall structure to determine the primary
modes of shaking. This was completed using a Single Value Decomposition (SVD) algorithm
on ﬁltered acceleration data in both the direction of shaking and the direction
perpendicular to shaking. The results from the SVD were used to plot the primary
modes of the structure. Finally, a low-rank reconstruction of the data was performed
to determine how the data was aﬀected by only accounting for the primary modes.
The last thing investigated with this data was an analysis of the interstory response.
Data was taken in the principle ground motion direction (x-direction, shown in Fig.
2) from all accelerometers on each story, and average time histories for each ﬂoor
were extracted. An SVD of these time histories was completed, and a Fast-Fourier
Transform of the primary mode revealed the fundamental frequency of vibration of
each</span></em></p>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>single-degree
of freedom representation of the structure’s ﬂoors. An observation matrix containing
all story accelerations for each test in the x-direction was also investigated.</span></em></p>

<div>

<h1><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>2
Theoretical Background</span></em></h1>

</div>

<div>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>Fast-Fourier
Transform</span></em></h2>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>Fourier introduced
the concept of representing a given function f(x) by a trigonometric series of sines
and cosines:</span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=348 height=45 id="Picture 29"
src="AMATH582_Final_MD_files/image004.jpg"></span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Based on
this idea, the Fast Fourier Transform (FFT) was created, which transforms a signal
from its original domain to a frequency domain. The Fourier Transform is an integral
transform deﬁned over the entire line x </span></em><em><span style='font-family:
"Cambria Math",serif;font-style:normal'>∈</span></em><em><span
style='font-style:normal'> [-∞, ∞]. The Fourier transform and its inverse are deﬁned
as</span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=333 height=93 id="Picture 30"
src="AMATH582_Final_MD_files/image005.jpg"></span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>The key
features of the FFT routine are as follows:</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>• It has
a low operation count: O(NlogN).</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>• It ﬁnds
the transform on an interval x </span></em><em><span style='font-family:"Cambria Math",serif;
font-style:normal'>∈</span></em><em><span style='font-style:normal'> [−L, L]. Since
the integration kernel is  oscillatory, it implies that the solutions on this ﬁnite
interval have periodic boundary conditions.</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>• The key
to lowering the operation count to O(N logN) is in discretizing the range x </span></em><em><span
style='font-family:"Cambria Math",serif;font-style:normal'>∈</span></em><em><span
style='font-style:normal'> [−L, L] into 2n points, i.e. the number of points should
be [2, 4, 8, 16, 32, 64, 128, 256, ...].</span></em></p>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>• The FFT
has excellent accuracy properties, typically well beyond that of standard discretization
schemes This type of transform can be used for many things in the ﬁeld of digital
signal processing and imaging because the transform can organize data by frequency
and it can be easier to ﬁnd strong frequencies and easier to identify frequencies
that may just be noise.</span></em></p>

<div>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>Gabor
Tranform/SFFT</span></em></h2>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>We can easily
obtain a Fourier transform of a set of points and resolve the frequency content
of such a set; However, signals over time or space contain sets of points for each
instance of the domain, and as a result, will lose the spatial or temporal resolution
of frequency magnitude peaks within the signal once a Fourier transform is performed.
This is due to the integration over the spatial or temporal domain which must be
completed in order to resolve the magnitude of the frequencies of the signal throughout
the domain.</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>If the entire
signal is sampled when a Fourier transform is completed, the frequency content of
the signal’s entire domain is represented in the Fourier transform.</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>One way
to temporally localize peaks in the frequency of a signal is to utilize a
window upon the temporal domain and perform a Fourier transform solely within the
windowed domain. This way, the frequency content obtained from a spectral
analysis of the window is known to most likely be within the window from which
the frequency content was calculated. Sliding the window over the domain and performing
Fourier transforms</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>on the
window creates spectral representations of each instance of windowing. These
spectral analysis ‘slices’ can be plotted over time creating spectrograms to
demonstrate the changes in frequency content throughout the signal. </span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>The chosen
method employed here and described above is known as a Gabor Transform, a windowed
version of the Fourier transform which involves replacing the original kernel of
the Fourier transform with one that allows a window to slide over the domain of
the function and isolate local frequency content centered around the window in time.
What is described is a discrete form of the integral,</span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=448 height=36 id="Picture 31"
src="AMATH582_Final_MD_files/image006.jpg"></span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>where
the function f(t) represents the signal as it varies with time and g(τ − t)
represents the Gabor Window</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>which
is utilized to ﬁlter the signal temporally. This can be represented in the
following form, as found in [2].</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'><img
border=0 width=556 height=41 id="Picture 32"
src="AMATH582_Final_MD_files/image007.jpg"></span></em></p>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>Singular
Value Decomposition</span></em></h2>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>The Singular
Value Decomposition, or SVD, is an incredibly powerful tool in linear algebra which
can be used to examine the principle dynamics of data. The technique uses an expansion
of the data into two bases to represent said data in diagonalized form, with principle
components and energies recorded to allow for reconstruction of the data in a lower
rank. According to Kutz, in Data Driven Modelling and Scientiﬁc Computing [2] ,
for any set of data A[m</span></em><em><span style='font-family:"Cambria Math",serif;
font-style:normal'>∗</span></em><em><span style='font-style:normal'>n], the SVD
makes diagonalization possible if the proper</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>bases for
the domain and range are used. Consider that since U and V are orthonormal bases
in C[m</span></em><em><span style='font-family:"Cambria Math",serif;font-style:
normal'>∗</span></em><em><span style='font-style:normal'>m] and C[n</span></em><em><span
style='font-family:"Cambria Math",serif;font-style:normal'>∗</span></em><em><span
style='font-style:normal'>n] respectively, then any vector in these spaces can be
expanded in their bases. In short, what this means is that any matrix can be diagonalized
with the SVD, as the method is not contingent on positive deﬁniteness or symmetry
of the matrix. The SVD of a matrix is guaranteed to exist; but the SVD does not
necessarily guarantee that all dynamics within the system will be captured. Careful
inspection of the</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>modal decomposition
of the data and energies associated with the proper orthogonal modes sheds light
on the primary dynamics and hidden dynamic behavior. The multiple bases utilized
in the SVD allow for decomposition of a symmetrized form of the data matrix, A.</span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>The SVD
can be performed with the following matrix operations,</span></em></p>

</div>

<div data-page-no=7 id=pf7>

<div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=486 height=269 id="Picture 33"
src="AMATH582_Final_MD_files/image008.jpg"></span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Post multiplication
of the above results with V and U respectively provides self-consistent Eigenvalue
problems,</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=473 height=99 id="Picture 34"
src="AMATH582_Final_MD_files/image009.jpg"></span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>The above
represents the decomposition of the data into its principle components and singular
values, which can then be used to create low rank approximations of the data. By
examining the singular values and the principle components and contributions of
each principle component to the features of the data analyzed, we can make inferences
about the driving dynamics of the data and interpret the eﬀects of interactions</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>between components
of the data.</span></em></p>

</div>

<div>

<h1><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>3
Algorithm Implementation and Development</span></em></h1>

</div>

<div>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>3.1
Filtering</span></em></h2>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>Due to the
large scale nature of this test, the data collected was very noisy, so before doing
any analysis on the data, it was ﬁltered. To determine which frequencies should
be ﬁltered out, an FFT was performed to ﬁnd the frequency content of the signal.
Using the results of the FFT, a Gaussian ﬁlter was chosen to ﬁlter out very high
frequency data:</span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=228 height=41 id="Picture 35"
src="AMATH582_Final_MD_files/image010.jpg"></span></em><em><span
style='font-style:normal'> (1)</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>After looking
more closely at the data, it was determined that there was also some very low frequency
content that needed to be ﬁltered out. In order to ﬁlter out this low frequency
data, an inverted Gaussian ﬁlter was chosen:</span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=219 height=43 id="Picture 36"
src="AMATH582_Final_MD_files/image011.jpg"></span></em><em><span
style='font-style:normal'> (2)</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>The data
that resulted from using both these ﬁlters is what was used for all the analyses
presented in this report. The same Gaussian ﬁlters were used for all accelerometer
sensors on the structure.<a href="#pf16"></a></span></em></p>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>&nbsp;</span></em></p>

<div data-page-no=8 id=pf8>

<div>

<div>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>3.2
White Noise</span></em></h2>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>To obtain
the natural frequencies from the white noise test, the accelerometer data (in the
primary direction of shaking) from all 21 white noise tests were loaded into Matlab.
Two for-loops were used, one to loop through each test (outer loop), and another
to loop through each sensor (inner loop). Within the inner loop, FFT was computed
on the ﬁltered acceleration data. Then, the average of the ﬁltered FFT data from
the sensors are computed. The max value is identiﬁed with the max(abs()) function
and the associated</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>frequency
is extracted. Note that the dominant frequency was extracted from the averaged data,
and for each individual sensor as well. Next, the outer loop will repeat these steps
for each test run. In order to obtain the second natural frequency, the algorithm
is repeated with a single Gaussian ﬁlter:</span></em></p>

</div>

<div>

<p class=MsoNormal><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'><img
border=0 width=256 height=40 id="Picture 37"
src="AMATH582_Final_MD_files/image012.jpg"></span></em><em><span
style='font-style:normal'> (3)</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>This is
to prevent ﬁltering out the second mode.</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>In summary,
three data analysis tools were employed for this section: (1) Gaussian ﬁlter, (2)
averaging ﬁlter, and (3) Fourier transform.</span></em></p>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

<div>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>3.3
Spectrogram of Ground Motion Response</span></em></h2>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>The algorithm
for computing the spectrogram of the structure from the ground motion starts like
the algorithm for the white noise. For the spectrogram, it is possible for
higher mode eﬀects to be removed using the Gaussian ﬁlter, thus only an inverse
Gaussian ﬁlter was used:</span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=250 height=47 id="Picture 38"
src="AMATH582_Final_MD_files/image013.jpg"></span></em><em><span
style='font-style:normal'> (4)</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Note that
the spectrogram was computed on data from a single sensor (center location on the
roof) from test 14 (earthquake ground motion).</span></em></p>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>In order to
obtain the spectrogram, the Gaussian ﬁlter with a window size, and step size was
selected (1 and 301, respectively). Then, the algorithm loops through each slice
of time and ﬁlters the signal. Next, FFT was computed on the time ﬁltered signal
and saved into a matrix that contains all the frequency content for each time slice.
Lastly, said matrix is plotted with time as the x-axis, and frequency as the y-axis.</span></em></p>

<div>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>3.4
Modal Analysis of Structure</span></em></h2>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>Using
the ﬁltered acceleration data from test 14, an SVD was performed to extract the
mode shapes. For this analysis the 20 accelerometers seen in Fig. 2 were all
used. As row vectors, the data from each accelerometer was appended in one large
matrix, and the SVD was taken of this matrix (using the built in SVD function in
MATLAB). Careful consideration was taken when assembling this matrix and the order
in which the accelerometer data was stacked in the matrix was noted. The order in
which the matrix was assembled was as follows:</span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=191 height=272 id="Picture 39"
src="AMATH582_Final_MD_files/image014.png"></span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>where x
floor1 is the ﬁltered acceleration data in the x direction, on the ﬂoor, in location
1. Taking the SVD of matrix A diagonalized the matrix and gives the lowest rank
possible. Computing the SVD of the matrix A results in three new matrices: U ,
Σ, and V . The matrix U has all the modes in column vectors, in order of highest
mode to lowest mode. The matrix Σ shows how much variance is in each mode for each
data point</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>included.
The matrix V is a representation of how much each data group is projected onto each
mode.</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>The amount
of energy from each mode was calculated using the Σ matrix. The diagonal of the
Σ matrix was divided by the sum of the diagonal to get the values in terms of percentage.
To determine what each mode looked like, the U matrix was used. This U matrix shows
for each mode, where the location of each data group would be. In order to
visualize these modes better, the location of each accelerometer was plotted on
a 3D plot. Then, for each mode, the mode shape value for each accelerometer
location from the U matrix was added to the original location. During this process,
the data from the U matrix that corresponded to the x direction accelerometer resulted
in movement in the x direction for that mode shape and same for the y direction.
In order to make the mode shapes more visible when plotting, a scale factor of 10
was applied to the displacements.</span></em></p>

<div>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>A low rank
reconstruction study was also performed on the data to determine how reconstructing
the data to include only the ﬁrst few major modes would aﬀect the accuracy of the
data. This was done by trimming the matrices U , Σ, and V to only include the ﬁrst
few modes and then multiplying them together with U ΣV</span></em><em><span
style='font-family:"Cambria Math",serif;font-style:normal'>∗</span></em><em><span
style='font-style:normal'> to get the reconstructed low rank approximation of the
data.</span></em></p>

</div>

<div>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>3.5
Interstory Response</span></em></h2>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>Average
time history of story accelerations for Test 14 were extracted from summing
over several realizations of ﬁltered accelerometer data from each ﬂoor. A Proper
Orthogonal Decomposition (POD) of the modes of the average accelerations per ﬂoor
was examined, and an interpretation of the U, Σ, and V components</span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>output from
the SVD was made. The most powerful spectral content of the average story acceleration
time histories was then investigated, and a correlative relationship between system
dynamics and fundamental frequency of POD modes is proposed.</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Interstory
response was investigated by examining the time history diﬀerence between accelerations
at the base of the wall and the ﬁrst story, and the diﬀerence between accelerations
at the ﬁrst story and those of the roof in the x-direction (primary direction of
excitation). Nominal acceleration time history per story was determined by averaging
over the time-synchronized accelerometer data of the groups of sensors on</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>each level,
eﬀectively smoothing out some of the high frequency noise within the signal. A SVD
was then completed on a set containing the average acceleration time history for
each level of the structure. The primary modes of this SVD represent the largest
variations in oscillatory behavior between stories over time. A Fourier Transform
was then performed on the most powerful SVD modes representing interstory acceleration
variance, and the most energy dense frequency of the spectral content was determined.</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>In short,
the algorithm can be described as follows:</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=624 height=309 id="Picture 40"
src="AMATH582_Final_MD_files/image015.jpg"></span></em></p>

</div>

<div data-page-no=a id=pfa>

<div>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'><img
border=0 width=404 height=337 id="Picture 6"
src="AMATH582_Final_MD_files/image016.jpg"></span></em></p>

<div>

<h1><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>4
Computational Results</span></em></h1>

</div>

<div>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>4.1
Filtering</span></em></h2>

</div>

<div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>Fig. 3 shows
an example of the ﬁltering procedure used for all the acceleration sensors. This
ﬁgure shows an example of just one acceleration sensor, but the same process was
used for all sensors. The top ﬁgure shows the frequency domain of the signal with
the two Gaussian ﬁlters applied to remove the very high frequency content and the
very low frequency content. The middle ﬁgure shows the post-processed frequency
content,</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>and the bottom
ﬁgure shows a comparison of the unﬁltered data with the ﬁltered data. From this
bottom ﬁgure it is clear that the signal is much clearer but still retains the general
behavior. Figure 3: Example of ﬁltering procedure used. (Top) Signal in the frequency
domain along with the two Gaussian ﬁlters used. (Middle) The post-ﬁltered signal
ﬁeld in the frequency domain. (Bottom) The time domain reconstruction of the ﬁltered
signal ﬁeld compared to the original, un-ﬁltered signal.</span></em></p>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>&nbsp;</span></em></h2>

</div>

<div>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>4.2
White Noise</span></em></h2>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>Figure 4
shows the ﬁrst natural period obtain from each sensor for tests 1, 2, 3, 7, 8, 9,
16, 20, and 21 (black circles). The blue line indicates the average of the black
circles, and the red line is the ﬁrst natural period using the average ﬁlter method
(see Section 3.2). The agreement of the black circles for each tests indicates the
Gaussian ﬁlter did a good job at cleaning up the noise. However, the discrepancy
between the blue and</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>red line,
e.g. see Fig. 4 tests 3, shows that ﬁltering via averaging reduced the noise further
(noise that the Gaussian ﬁlter did not remove). Test 9 shows good agreement between
the blue and red line, indicating the Gaussian ﬁlter removed most of the noise and
the averaging ﬁlter did not contribute much. By plotting the natural period from
the individual sensors, the discrepancies from the sensors can also be identiﬁed.
Lastly, the diﬀerent tests yielded diﬀerent natural periods. This is as expected
because the white noise ground motion tests are performed between earthquake
ground motion tests (and modiﬁcations) that may lead to damage or reparation of
the structure, respectively. This can also be seen clearer in Fig. 5. The natural
period of the ﬁrst and second modes are shown (top and bottom, respectively). The
natural period of the ﬁrst mode increases from tests 1 to 3. This is expected as
test 2 was conducted after the ﬁrst earthquake ground motion that likely loosen
the structural connections (softening the system). Similarly,<a href="#pfa"></a>
<a href="#pfb"></a> <a href="#pf8"></a> </span></em></p>

</div>

<div data-page-no=b id=pfb>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=605 height=363 id="Picture 7"
src="AMATH582_Final_MD_files/image017.jpg"></span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Figure 4:
First natural period</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>test 3 had
an increase because the structure experienced yielding which further softened the
system. The decrease in the natural period of the ﬁrst mode can be contributed to
reparations made to the structure. From Fig. 5, there is not much variation in the
natural period of the second mode. As expected, the natural period are lower for
the second mode (higher frequencies). The consistency of the natural period of the
second mode suggests that the higher modes are not sensitive to the structural damages
incurred during earthquake ground motions.</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><a
href="#pfc"></a></span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

</div>

<div data-page-no=c id=pfc>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=351 height=263 id="Picture 8"
src="AMATH582_Final_MD_files/image018.jpg"></span></em></p>

<div>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>Figure 5:
Evolution of ﬁrst natural frequency</span></em></p>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>&nbsp;</span></em></h2>

</div>

<div>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>4.3
Spectrogram of Ground Motion Response</span></em></h2>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>Figure 6
is a spectrogram of the acceleration from the center sensor on the roof from earthquake
ground motion 14. Note that only data from this sensor from this ground motion was
provided for the sake of brevity, but similar ﬁndings can be seen from the other
data. From the spectrogram, the signal noise is negligeable compared to the accelerations
due to the ground motion, as expected. This can be seen by the lack of color before
the 5 second mark and after the 30 second mark. The spectrogram illustrates the
dominate frequency is approximately 8 rads/s. This is approximately 0.8
seconds, similar to the natural period from Fig. 5 (1st mode, test number 14). This
is promising because</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>it
showed the structure primary response is similar to the natural period of the ﬁrst
mode. Furthermore, the higher frequencies shaking was present only during strong
shaking. This can be seen from the spectrogram where high frequencies coincide
with brighter colors in the lower frequencies. The higher band of frequencies (approximately
175 rads/s) is also around the natural period of the second mode (approximately
0.0325 s). The nature of earthquakes is that they occur in a wide range of frequencies
(and often random-like</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>features).
As a results, the structure will respond with frequencies outside of the
natural frequency. However, the structure acts similar to a ﬁlter in which the response
is ﬁlter to the frequencies in the neighborhood of the natural frequencies of the
structure.</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><a
href="#pfc"></a></span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

<div data-page-no=d id=pfd>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=385 height=829 id="Picture 9"
src="AMATH582_Final_MD_files/image019.jpg"></span></em></p>

<div>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>Figure 6:
Spectrogram of acceleration from ground motion 14, center sensor on roof</span></em></p>

</div>

<div>

<h2><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>4.4
Modal Analysis of Structure</span></em></h2>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>The
results from this section are all from the data collected from test 14, the last
and largest ground motion. The same analysis could have been done for any or all
of tests, but only the results from one ground motion are included. Fig. 7 shows
the amount of energy in each mode that resulted from the SVD test on the structure.
The results from this plot show that the ﬁrst mode is very much the dominate mode,
accounting for almost 70% of the total energy, which is very common for
buildings and very much expected. The second mode accounts for about 20% of the
total energy and after mode 6, the energy contribution is near zero. Fig. 8 shows
the results of the U matrix from the SVD. It should be noted that on the x axis
are the nodes or the accelerometer recordings. Every other recording is the representative
of the acceleration in the direction perpendicular to shaking, which is why
most of them are near zero. We would expect that the ﬁrst</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>couple modes
are primarily in the direction of shaking which is what we see for modes 1 and 2.
It should also be noted that the ﬁrst half of the points are representative of the
accelerations recorded on the ﬂoor and the second half are from the roof. In the
ﬁrst mode, all movement is in the same direction, but for the second mode, the ﬁrst
ﬂoor goes in one direction while the roof goes in the opposite direction. This is
expected behavior in buildings. The third mode doesn’t have a clear pattern
like the ﬁrst two modes, so this is probably a torsional mode.</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>Figure 7:
Energy per mode from the SVD analysis of the structure </span></em></p>

</div>

<p class=MsoNormal><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

<div data-page-no=e id=pfe>

<div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'><img
border=0 width=337 height=270 id="Picture 10"
src="AMATH582_Final_MD_files/image020.jpg"></span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Figure 8:
Modes from the SVD analysis of the structure </span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>To get a
better visual idea of these modes shapes, the mode values from Fig. 8 were applied
to the corresponding locations of the accelerometers and plotted as displacements
in 3D. This visual representation of the mode shapes can be seen in Fig. 9. In these
plots, the grey lines are representative of the original location of the ﬂoor and
roof, while the black lines are the mode shapes. The ﬁrst mode is exactly what we
would expect in a building. Both the ﬂoor and roof move in the same direction that
is also in the same direction as the earthquake shaking. The second mode is also
what is expected. The roof has movement in one direction while the ﬂoor is moving
in the other. The third mode shape is also what we predicted from Fig. 8: it is
a torsional mode. The fourth mode is very similar to the ﬁrst mode, but the movement
of the ﬂoors is in the direction perpendicular to earthquake shaking. The following
two modes are diﬀerent types</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>of
torsional modes. These are all modes that we would expect for building response.
It should be noted that only data from the ﬂoor and roof were used (no data from
the wall was used) so these mode shapes are only representative of how the ﬂoors
moved, not the walls. Future study can be conducted on the sensor data along the
height of the wall that may lead to ﬁndings on higher mode eﬀects that is not torsional
but what is expected for higher modes of cantilever walls.</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

<div data-page-no=f id=pff>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=577 height=633 id="Picture 11"
src="AMATH582_Final_MD_files/image021.jpg"></span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Figure 9:
Mode shapes from the SVD analysis of the structure</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>15</span></em></p>

</div>

</div>

</div>

<div data-page-no=10 id=pf10>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=585 height=643 id="Picture 12"
src="AMATH582_Final_MD_files/image022.jpg"></span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>The
ﬁnal portion of the modal analysis was to complete a low-rank reconstruction. From
Fig. 7 it is clear that anything greater than the second mode doesn’t contribute
much to the overall behavior. The low-rank reconstruction for two acceleration sensors
are show in Fig. 10. This ﬁgure shows a rank reconstruction of rank 1, 2, 5, and
10. The rank 2 reconstruction does a very good job at capturing the overall behavior.
Because of this, we can conclude that there were very small torsional eﬀects during
the shaking of the structure, almost all of the movement was just from ﬁrst and
second mode eﬀects. Figure 10: Low-Rank reconstruction of the accelerometers from
the SVD of the structure</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

</div>

<div data-page-no=11 id=pf11>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=655 height=454 id="Picture 13"
src="AMATH582_Final_MD_files/image023.jpg"></span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>4.5 Story/Interstory
Response</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>The ﬁrst
four modes from the SVD of the single degree of freedom accelerometer data seen
in the left-most columns of Fig. 11 and Fig. 13. As can be seen in Fig. 11 in the
leftmost column, the average acceleration data (shown in red, underneath the most
powerful reconstructed mode) lacks high degrees of noise, and the frequency content
of the data indicates that there is a predominant frequency which contains most
of the signal’s energy. Other modes of the POD represent the dominant variations
from the averaged signal that each measurement is somewhat likely to be partially
comprised of. SVD modal participation is contained within V , however, the modal
participations of an SDOF vibration is not of interest in this case. From the PSD
plot on the right-hand side of the ﬁgure one can note the dominant power density
of the primary frequency of pointwise vibration in the ﬁrst POD mode, while the
frequency content and power spectra content of the other modes is saturated and
no dominant frequency is discernible. This indicates high congruence of the acceleration
data measured from each of the sensors within the ﬂoor in the inspected direction,
with little time variance and negligible amplitude/power diﬀerence. In order for
frequency content of a single degree of freedom to be resolved, a Fourier Transform
was performed on the time history content of the primary modes of the SVD. The results
of the Fourier Transform and Power Spectral Density Estimates of the SVD modes can
be seen in the centre and righthand columns of Figs. 11 through 13.</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Figure 11:
SVD and FFT(U) of Roof Accelerations. The observation matrix for the SVD of the
acceleration time history each ﬂoor contained all x-direction accelerometers for
Test No. 14. Output and the SVD modes are comprised of variations between sensor
<a href="#pf11"></a></span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>

<div data-page-no=12 id=pf12>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=593 height=406 id="Picture 14"
src="AMATH582_Final_MD_files/image024.jpg"></span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>acceleration
magnitude measurements, key features of higher energy vibrations and shocks,
and predominant excitation of modes of lower energy vibration. The most powerful
mode of each SVD is evidently the transient and homogeneous vibrational
response of the story to the ground motion excitation. Most of the vibrational energy
of the system is captured by the ﬁrst mode of the SVD (power scaling from the S
 components of the SVD is represented by the projection of U into the (g) domain
via U </span></em><em><span style='font-family:"Cambria Math",serif;font-style:
normal'>∗</span></em><em><span style='font-style:normal'> S). The second, third
and fourth modes represent the predominant variations of signal intensity and phase
from the average predominant behavior of the data set, as well as noise that is
common to all signals. Looking closely at the ﬁrst and third modes of the SVD in
Fig. 12, there is a clear diﬀerence in the frequency concentration. The ﬁrst mode
is the predominant motion of the ground acceleration. The second most powerful can
be interpreted as the contribution to overall acceleration the from action of the
ﬂoors in</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>tandem,
synchronized aside from a slight change in phase. The third mode of the SVD can
be interpreted as the eﬀect of a secondary dynamical state, whether it be the second
or third lowest energy mode of structural response vibration or a compound eﬀect
of several participating vibrational modes.</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Figure 12:
SVD and FFT(U) of 1<sup>st</sup> Story Accelerations.</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>&nbsp;</span></em></p>

<div data-page-no=13 id=pf13>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=662 height=452 id="Picture 15"
src="AMATH582_Final_MD_files/image025.jpg"></span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Figure 13:
SVD and FFT(U) of 1<sup>st</sup> Story Accelerations.</span></em></p>

</div>

</div>

</div>

<div data-page-no=14 id=pf14>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'><img
border=0 width=624 height=819 id="Picture 16"
src="AMATH582_Final_MD_files/image026.jpg"></span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Figure 14:
Interstory Accelerations.</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Figure 15:
SVD and FFT(U) of Interstory Accelerations.</span></em></p>

</div>

</div>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>Fig. 14
shows the interstory accelerations extracted from the averaged story acceleration
time histories. The interstory relative accelerations between Floor 1 and the Roof
are nearly two times those of the relative accelerations between the base of the
structure and the ﬁrst ﬂoor. This is likely due to combinations of ﬁrst and second
vibrational mode eﬀects, their superpositions of modal vibration and shapes acting
in constructive</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>interference
beats to generate larger amplitude accelerations within the second story portion
of the shear walls.</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>A singular
value decomposition of the averaged story acceleration time histories (base, 1st
ﬂoor, and roof) was completed and a Fourier analysis was completed on the strongest
power orthogonal modes of the decomposition. The results of this analysis can be
seen in Fig. 15. The spectral analysis represents the fundamental frequency of the
time history of variations in structural response acceleration between measurements
at varying points along the structure’s height due to random base excitation in
the primary direction of resistance. The frequency of the ground motion was found
to be roughly 4.46 hertz, and the natural frequency of the ﬁrst most powerful resonance
mode obtained from the singular value decomposition of the acceleration data
from sensors in the ground excitation direction along various heights of the
structure was 10.33hz, giving the structure a measured ﬁrst natural period, T nSV
D1, of 0.6082 seconds. The natural</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>frequency
of the second mode of the structure appears to be 28.757 hz with measured second
natural period, TnSV D2, of 0.2185 seconds.</span></em></p>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>This is incongruent
with previously found values for the resonant frequency, which were obtained via
pointwise investigation of the Fourier transform of the acceleration data of the
individual sensors. What likely is happening with the SDOF extraction is a biasing
of the Fourier domain toward the predominant ground motion acceleration frequency,
as the acceleration data was not normalized by the ground motion acceleration
and thus that ground motion frequency participated in the Fourier Transform. This
would have an eﬀect of lengthening the estimated period of vibration, which is in
agreement with the postulation of ground motion acceleration biasing SDOF FFT output
to lower frequencies, as the spectral content of the modes of the SVD of the interstory
accelerations is of higher frequencies than that of the SDOF analysis. Since
the ground motions are included in the SVD of the overall interstory
acceleration data, they are easily extracted by the SVD as they are the most powerful
contribution to acceleration, and the remaining most powerful modes of the SVD to
be examined are either noise or dynamical response modes which can be isolated and
analyzed for their frequency content, which possibly provides the overall structural
dynamical response natural frequencies of the system.</span></em></p>

<div>

<h1><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>5
Summary and Conclusions</span></em></h1>

</div>

<div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>Data from
two-story timber building shake table test were analyzed to investigate the dynamical
properties and the ground motion response of the structure. The accelerometer data
was ﬁltered using a Gaussian and inverted Gaussian ﬁlter in order to remove high
frequency and low frequency noise.</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>The data
from the white noise test gave the natural period of the ﬁrst and second mode (0.9
seconds and 0.0325 seconds, respectively). In addition, it showed the change in
the natural period of the ﬁrst mode between each ground motion testing and modiﬁcation.
The natural period of the second mode appeared to be less sensitive to the damage
and modiﬁcations on the structure. From the consistency in the natural period from
the individual sensor results, it can be seen that the Gaussian ﬁlter performed
well. However,</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>future study
can further examine this by removing the ﬁlter and looking at the natural period
from the individual sensor results (if the results remain unchanged, then that indicates
the noise did not aﬀect the results of the natural period). Furthermore, the discrepancy
between the individual sensor results of the natural frequency and the natural frequency
from the average ﬁlter method suggests that the average ﬁlter further reduced noise
in the data. Spectrogram were computed and showed that the dominate frequencies
are in the neighborhood of the natural period of the ﬁrst mode. In addition, the
frequencies from the higher modes were only present during intense shaking (and
were also in the neighborhood of the natural period of the second mode). From this,
it can be seen that the structure acted as a vibration ﬁlter which took the wide
range of frequencies</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>from the
earthquake motion and responded with two frequency bands. The third and higher modes
were not immediately visible from the spectrogram. Future study can compare the
frequency content of the earthquake and compare it the frequency content of the
structure’s response. Modal analysis was done using SVD. Singular value decomposition
was done on the sensors from test 14 and showed the energy of each mode (70% and
20% for mode 1 and 2, respectively). The SVD also revealed that negligle energy
was contributed by modes higher than 6. The SVD also allowed the visualization of
the mode shapes of the building, which were as expected from studies in earthquake
engineering. Low rank reconstruction was done and showed the dynamical behavior
was mostly contained within the ﬁrst two modes. Note that this is not how earthquake
engineers typically get the mode shapes. Typically, eigenanalysis is used, but it
is shown that SVD gives the same results commonly seen in earthquake engineering</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>(or structural
dynamics). The ﬁrst mode of the Singular Value Decomposition of the interstory
acceleration data is the predominant ground acceleration. The rest of the most powerful
modes are either high energy noise, or contributions to the acceleration signal
from the structure’s participation in predominant vibrational modes that correspond</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>to its natural
frequencies. These natural frequencies were extracting using spectral analysis and
fourier transformations on the SVD modes. The frequency of the ground motion was
found to be roughly 4.46 hertz, and the ﬁrst natural frequency of the
acceleration data from sensors in the ground excitation direction along various
heights of the structure was 10.33hz, giving the structure a measured ﬁrst natural
period,</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>T nSV D,
of 0.6082 seconds. The second measured natural period using combined SVD and FFT
methods, TnSV D2, was found to be 0.2185 seconds. Including ground motion in the
SVD of the overall interstory acceleration data allows ground motion inﬂuence upon
acceleration data to be easily extracted by the SVD, as it is the most powerful
contribution to acceleration. The remaining most powerful modes of the SVD may</span></em></p>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>likely be
dynamic structural response modes which can be isolated and analyzed for their
frequency content. Using the many techniques in data analysis (e.g. Gaussian ﬁlters,
average ﬁlters, Fourier transform, short-time Fourier transform (i.e. spectrograms),
and SVD), the data from the shake table test were quickly andsystematically analyzed
and the major dynamical phenomenons identiﬁed.</span></em></p>

<div>

<h1><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>References</span></em></h1>

</div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>[1] Brian
DeMeza. “Design and Testing of Shake-Table Specimen of Cross-Laminated Timber and
Cross-Laminated Timber-Concrete Composite Diaphragms”. MA thesis. Corvallis, OR:
Oregon State University, 2018.</span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>[2] Jose
Nathan Kutz. Data-driven modeling &amp; scientiﬁc computation: methods for complex
systems &amp; big data. Oxford University Press, 2013.</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>[3] Colorado
School of Mines. NHERI TallWood. Accessed: 2020-03-19. 2020. url: http://nheritallwood.mines.edu/.</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>[4] Shiling
Pei and et. al. “Experimental seismic response of a resilient two-story mass
timber building with post-tensioned rocking walls”. In: ASCE Journal of Structural
Engineering 145.11 (2019), p. 04019120.</span></em></p>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>[5] E.
Rathje et al. DesignSafe: A New Cyberinfrastructure for Natural Hazards Engineering.
ASCE Natural Hazards Review, doi: 10.1061/(ASCE)NH.1527-6996.0000246. 2017.</span></em></p>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>[6] Sarah
Wichman. “Large-Scale Dynamic Testing of Rocking Cross Laminated Timber Walls”.
MA thesis.</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>Seattle, WA:
University of Washington, 2018.</span></em></p>

</div>

<div>

<h1><em><span style='font-family:"Calibri Light",sans-serif;font-style:normal'>Appendix
A MATLAB Functions</span></em></h1>

</div>

<div>

<p class=MsoListParagraphCxSpFirst><em><span style='font-style:normal'>The following
are the important MATLAB functions used:</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>• Y = fftn(X)
returns the multidimensional Fourier transform of an N-dimensional array using a
Fast Fourier Transform.</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>• X = ifftn(Y)
returns the multidimensional discrete inverse Fourier transform of an N-dimensional
array using a Fast Fourier Transform algorithm.</span></em></p>

</div>

<div data-page-no=17 id=pf17>

<div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>• Y = fft(X)
computes the discrete Fourier transform of X using a fast Fourier transform algorithm.</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>• Y = fftsift(X)
rearranges a Fourier transform X by shifting the zero-frequency component to the
center of the array.</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>• pcolor(C)
pcolor(C) creates a pseudocolor plot using the values in matrix C. A pseudocolor
plot</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>displays
matrix data as an array of colored cells, as a ﬂat surface in the x-y plane.</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>• D = diag(A)
returns a column vector of the main diagonal elements of A.</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>• [U,S,V]
= svd(A,’econ’) produces an economy-size decomposition of m-by-n matrix A. The economy-size
decomposition removes extra rows or columns of zeros from the diagonal matrix of
singular values, S, along with the columns in either U or V that multiply those
zeros in the expression A = U*S*V’. Removing these zeros and columns can improve
execution time and reduce storage requirements without compromising the accuracy
of the decomposition.</span></em></p>

</div>

<p class=MsoListParagraphCxSpMiddle><em><span style='font-style:normal'>• s = spectrogram(x)
returns the short-time Fourier transform of the input signal, x. Each column of
s contains an estimate of the short-term, time-localized frequency content of x.</span></em></p>

</div>

<div>

<p class=MsoListParagraphCxSpLast><em><span style='font-style:normal'>&nbsp;</span></em></p>

</div>
Appendix A MATLAB Functions
The following are the important MATLAB functions used:
• Y = fftn(X) returns the multidimensional Fourier transform of an N-dimensional array using a Fast
Fourier Transform.
• X = ifftn(Y) returns the multidimensional discrete inverse Fourier transform of an N-dimensional
array using a Fast Fourier Transform algorithm.
22
• Y = fft(X) computes the discrete Fourier transform of X using a fast Fourier transform algorithm.
• Y = fftsift(X) rearranges a Fourier transform X by shifting the zero-frequency component to the
center of the array.
• pcolor(C) pcolor(C) creates a pseudocolor plot using the values in matrix C. A pseudocolor plot
displays matrix data as an array of colored cells, as a 
at surface in the x-y plane.
• D = diag(A) returns a column vector of the main diagonal elements of A.
• [U,S,V] = svd(A,'econ') produces an economy-size decomposition of m-by-n matrix A. The economy-
size decomposition removes extra rows or columns of zeros from the diagonal matrix of singular values,
S, along with the columns in either U or V that multiply those zeros in the expression A = U*S*V'. Re-
moving these zeros and columns can improve execution time and reduce storage requirements without
compromising the accuracy of the decomposition.
• s = spectrogram(x) returns the short-time Fourier transform of the input signal, x. Each column of
s contains an estimate of the short-term, time-localized frequency content of x.
Appendix B MATLAB Code
The following is the Matlab code used to process the data.
The url to the github page with the Matlab code is:
https://github.com/nsaoirse/Data-Analysis-on-CLT-Rocking-Shear-Walls
 B.1 Filtering Examples & Modal Analysis of Structure
      1 clc
      2 clear
      3 close all
      4
      5 load ('test_data . mat ')
      6
      7 test_num = 14;
      8 %A = [ test_data {14 ,1}. AC1E402 , test_data {14 ,1}. AC1E401 , test_data {14 ,1}. AC1E301 , test_data
      {14 ,1}. AC1E102 , test_data {14 ,1}. AC1E101 , test_data {14 ,1}. ACRE402 , test_data {14 ,1}.
      ACRE401 , test_data {14 ,1}. ACRE313 , test_data {14 ,1}. ACRE102 , test_data {14 ,1}. ACRE101 ];
      9 A = [ test_data { test_num ,1}. AC1E402 ';
      10 test_data { test_num ,1}. AC1N402 ';
      11 test_data { test_num ,1}. AC1E402 ';
      12 test_data { test_num ,1}. AC1N402 ';
      13 test_data { test_num ,1}. AC1E301 ';
      14 test_data { test_num ,1}. AC1N301 ';
      15 test_data { test_num ,1}. AC1E102 ';
      16 test_data { test_num ,1}. AC1N102 ';
      17 test_data { test_num ,1}. AC1E101 ';
      18 test_data { test_num ,1}. AC1N101 ';
      19 test_data { test_num ,1}. ACRE402 ';
      20 test_data { test_num ,1}. ACRN402 ';
      21 test_data { test_num ,1}. ACRE401 ';
      22 test_data { test_num ,1}. ACRN401 ';
      23 test_data { test_num ,1}. ACRE313 ';
      24 test_data { test_num ,1}. ACRN313 ';
      25 test_data { test_num ,1}. ACRE102 ';
      26 test_data { test_num ,1}. ACRN102 ';
      27 test_data { test_num ,1}. ACRE101 ';
      28 test_data { test_num ,1}. ACRN101 '];
      29 SignalName = {'AC1E402 ','AC1N402 ','AC1E402 ','AC1N402 ','AC1E301 ','AC1N301 ', ...
      30 'AC1E102 ','AC1N102 ','AC1E101 ','AC1N101 ','ACRE402 ','ACRN402 ', ...
      31 'ACRE401 ','ACRN401 ','ACRE313 ','ACRN313 ','ACRE102 ','ACRN102 ', ...
      32 'ACRE101 ','ACRN101 '};
      33 time = test_data { test_num ,1}. time ;
      23
      34
      35 L = time ( end );
      36 n = length ( time );
      37 t2 = linspace (-L,L,n +1) ;
      38 t = time ;
      39 k = (2* pi /(2* L)) *[0:( n/2 -1) -n /2: -1];
      40 g = 386.4;
      41
      42 anf = zeros ( size (A));
      43 dnf = zeros ( size (A));
      44 for ii = 1: size (A ,1)
      45 an = detrend (A(ii ,:) );
      46 vn = cumtrapz (time ,an*g);
      47 dn = cumtrapz (time ,vn);
      48
      49 ant = fft (an*g);
      50 an = ifft ( ant );
      51
      52 filter = exp ( -0.008*( k) .^2) ;
      53 filter2 = 1- exp ( -1*(k) .^2) ;
      54 anft = filter .* ant ;
      55 anft = filter2 .* anft ;
      56 anf (ii ,:) = ifft ( anft );
      57
      58 vnf = cumtrapz (time , anf (ii ,:));
      59 dnf (ii ,:) = cumtrapz (time , vnf);
      60
      61 if ii == 15
      62
      63 figure ('units ','inches ','position ' ,[0.5 0.5 6 5])
      64 subplot (3 ,1 ,1)
      65 hold on
      66 plot ( fftshift (k), abs ( fftshift ( ant ))/ max ( abs ( fftshift ( ant ))),'Color ','black ','
      DisplayName ','Signal ')
      67 plot ( fftshift (k),fftshift ( filter ),'k','Linewidth ' ,1.5 , 'Color ','blue ',' DisplayName ','
      Low - Pass Filter ')
      68 plot ( fftshift (k),fftshift ( filter2 ),'k','Linewidth ' ,1.5 , 'Color ','red ',' DisplayName ','
      High - Pass Filter ')
      69 legend ('show ','location ','northeast ')
      70 xlabel ('wavenumber (k)')
      71 ylabel ('|a_{t }|/ max (| a_{t }|) ')
      72 xlim ([ -50 ,50])
      73 box on; grid on
      74 set (gca ,' GridLineStyle ',':','GridColor ' ,[0.7 0.7 0.7] , 'GridAlpha ' ,1)
      75 set (gca ,'FontSize ' ,10,'FontName ','Arial ')
      76 set (gcf , 'Color ', 'w')
      77
      78 subplot (3 ,1 ,2)
      79 plot ( fftshift (k),abs( fftshift ( anft ))/ max (abs ( fftshift ( anft ))),'color ','black ','
      DisplayName ','Filtered Signal ','Linewidth ' ,1.5)
      80 xlabel ('wavenumber (k)')
      81 ylabel ('|a_{t }|/ max (| a_{t }|) ')
      82 legend ('show ','location ','northeast ')
      83 xlim ([ -50 ,50])
      84 box on; grid on
      85 set (gca ,' GridLineStyle ',':','GridColor ' ,[0.7 0.7 0.7] , 'GridAlpha ' ,1)
      86 set (gca ,'FontSize ' ,10,'FontName ','Arial ')
      87 set (gcf , 'Color ', 'w')
      88
      89 subplot (3 ,1 ,3)
      90 hold on
      91 plot (t,an ,'linewidth ' ,1.5 , 'Color ','black ',' DisplayName ','Unfilted Signal ')
      92 plot (t, anf (ii ,:) ,'linewidth ' ,1.5 , 'Color ','blue ',' DisplayName ','Filtered Signal ')
      93 legend ('show ','location ','northeast ')
      94 xlim ([0 45])
      95 xlabel ('Time (s)')
      96 ylabel ('Accel (g)')
      97 box on; grid on
      24
      98 set (gca ,' GridLineStyle ',':','GridColor ' ,[0.7 0.7 0.7] , 'GridAlpha ' ,1)
      99 set (gca ,'FontSize ' ,10,'FontName ','Arial ')
      100 set (gcf , 'Color ', 'w')
      101 saveas (gcf ,' filter_ACRE313 . png ')
      102 end
      103
      104 end
      105
      106 [u_a ,s_a , v_a ] = svd (anf ,'econ ');
      107
      108 % reconstruction
      109 rank = [1 ,2 ,5 ,10];
      110 low_rank = cell ( length ( rank ) ,1);
      111 for ii = 1: length ( rank )
      112 low_rank {ii ,1} = u_a (: ,1: rank (ii))*s_a (1: rank (ii) ,1: rank (ii))* v_a (: ,1: rank (ii)) ';
      113 end
      114
      115 figure ('units ','inches ','position ' ,[0.5 0.5 5 3])
      116 hold on
      117 plot ( diag ( s_a )/ sum ( diag ( s_a ))*100 , 'Color ','black ','linewidth ' ,1.5)
      118 xlabel ('Mode ')
      119 ylabel ('Energy in Mode (%) ')
      120 xlim ([1 20])
      121 xticks (1:1:20)
      122 box on; grid on
      123 set (gca ,' GridLineStyle ',':','GridColor ' ,[0.7 0.7 0.7] , 'GridAlpha ' ,1)
      124 set (gca ,'FontSize ' ,10,'FontName ','Arial ')
      125 set (gcf , 'Color ', 'w')
      126 saveas (gcf ,'Energy . png ')
      127
      128 figure ('units ','inches ','position ' ,[0.5 0.5 5 4])
      129 hold on
      130 colorList = {'black ','blue ','red '};
      131 for ii = [3 2 1]
      132 plot ( u_a (:, ii),'color ',colorList {ii},' DisplayName ' ,['Mode = ', num2str (ii)],'Linewidth '
      ,1.5)
      133 end
      134 legend ('show ','location ','northwest ')
      135 xlabel ('Node ')
      136 ylabel ('Mode Magnitude ')
      137 box on; grid on
      138 set (gca ,' GridLineStyle ',':','GridColor ' ,[0.7 0.7 0.7] , 'GridAlpha ' ,1)
      139 set (gca ,'FontSize ' ,10,'FontName ','Arial ')
      140 set (gcf , 'Color ', 'w')
      141 saveas (gcf ,'modes .png ')
      142
      143 %% mode shapes
      144
      145 coords = [ -10 29 12;
      146 10 29 12;
      147 0 0 12;
      148 -10 -29 12;
      149 10 -29 12;
      150 -10 29 22;
      151 10 29 22;
      152 0 0 22;
      153 -10 -29 22;
      154 10 -29 22];
      155
      156 mode_num = 1;
      157 scale = 10;
      158
      159 num_modes = 6;
      160 coords_mode = cell ( num_modes ,1) ;
      161 for ii = 1: num_modes
      162 coords_mode {ii ,1} = coords ;
      163 coords_mode {ii ,1}(: ,1) = coords (: ,1) + u_a (1:2: end ,ii)* scale ;
      164 coords_mode {ii ,1}(: ,2) = coords (: ,2) + u_a (2:2: end ,ii)* scale ;
      25
      165 end
      166
      167 coords_new (: ,1) = coords (: ,1) + u_a (1:2: end , mode_num )* scale ;
      168 coords_new (: ,2) = coords (: ,2) + u_a (2:2: end , mode_num )* scale ;
      169 coords_new (: ,3) = coords (: ,3);
      170
      171 lines = [1 2;
      172 1 4;
      173 2 5;
      174 4 5;
      175 1 3;
      176 2 3;
      177 4 3;
      178 5 3;
      179 6 7;
      180 6 9;
      181 7 10;
      182 9 10
      183 6 8;
      184 7 8;
      185 9 8;
      186 10 8];
      187
      188 colorList = {'black ','blue ','red '};
      189 figure ('units ','inches ','position ' ,[0.5 0.5 7.5 9.5])
      190 for jj = 1: num_modes
      191 subplot (3 ,2 , jj)
      192 for ii = 1: size (lines ,1)
      193 plot3 ([ coords ( lines (ii ,1) ,1) , coords ( lines (ii ,2) ,1)],[ coords ( lines (ii ,1) ,2) , coords (
      lines (ii ,2) ,2)],[ coords ( lines (ii ,1) ,3) , coords ( lines (ii ,2) ,3)],'o-','color ' ,[0.6 0.6
      0.6] , ' MarkerFaceColor ' ,[0.6 0.6 0.6] , 'markersize ' ,4)
      194 hold on
      195 plot3 ([ coords_mode {jj ,1}( lines (ii ,1) ,1) , coords_mode {jj ,1}( lines (ii ,2) ,1)], ...
      196 [ coords_mode {jj ,1}( lines (ii ,1) ,2) , coords_mode {jj ,1}( lines (ii ,2) ,2)], ...
      197 [ coords_mode {jj ,1}( lines (ii ,1) ,3) , coords_mode {jj ,1}( lines (ii ,2) ,3)], ...
      198 'o-','markersize ' ,4,'color ',colorList {1} , ' MarkerFaceColor ',colorList {1})
      199 axis equal
      200 end
      201 view ( -37.5 ,20)
      202 xlim ([ -15 ,15])
      203 ylim ([ -40 ,40])
      204 zlim ([0 ,24])
      205 title ([ 'Mode ' num2str (jj)])
      206 box on; grid on
      207 set (gca ,' GridLineStyle ',':','GridColor ' ,[0.7 0.7 0.7] , 'GridAlpha ' ,1)
      208 set (gca ,'FontSize ' ,10,'FontName ','Arial ')
      209 set (gcf , 'Color ', 'w')
      210 end
      211 saveas (gcf ,' modes_shapes .png ')
      212
      213 %% reconstruction
      214
      215 sensors = [5 ,15];
      216 figure ('units ','inches ','position ' ,[0.5 0.5 7.5 8.5])
      217 for ii = 1: length ( rank )
      218 for jj = 1: length ( sensors )
      219 subplot ( length ( rank ),length ( sensors ),ii* length ( sensors )+jj - length ( sensors ))
      220 hold on
      221 plot (time ,A( sensors (jj) ,:)*g,' DisplayName ','Original ','Color ','Black ','Linewidth '
      ,1.2)
      222 plot (time , anf ( sensors (jj) ,:) ,' DisplayName ','Filtered ','Color ','Blue ','Linewidth '
      ,1.2)
      223 plot (time , low_rank {ii ,1}( sensors (jj) ,:) ,' DisplayName ' ,['rank = ' num2str ( rank (ii))],
      'Color ','Red ','Linewidth ' ,1.2)
      224 xlabel ('Time (sec)')
      225 ylabel ('Accel (g)')
      226 title ([ 'Sensor ' SignalName { sensors (jj) }])
      227 legend ('show ','location ','northeast ')
      26
      228 xlim ([0 45])
      229 box on; grid on
      230 set (gca ,' GridLineStyle ',':','GridColor ' ,[0.7 0.7 0.7] , 'GridAlpha ' ,1)
      231 set (gca ,'FontSize ' ,8,'FontName ','Arial ')
      232 set (gcf , 'Color ', 'w')
      233 end
      234 end
      235 saveas (gcf ,' reconstruction . png ')
  Listing 1: Code for ltering data and for performing the modal analysis of structure
  B.2 White Noise
      1 %% Final Project
      2 % Script for final project
      3
      4 %% Load data
      5 clc ; clear ; close all
      6
      7 load ('wn_data .mat ')
      8
      9 g = 386.09; % Acceleration due to gravity ( inches per second per second )
      10 n1 = 21; % number of runs
      11 n2 = 10; % number of acceleromets
      12
      13 for idx1 = 1: n1 % loop through each test
      14 % Aggregate the accelerations
      15 A = [ wn_data {idx1 ,1}. AC1E402 '; wn_data {idx1 ,1}. AC1E401 '; ...
      16 wn_data {idx1 ,1}. AC1E301 '; wn_data {idx1 ,1}. AC1E102 '; ...
      17 wn_data {idx1 ,1}. AC1E101 '; wn_data {idx1 ,1}. ACRE402 '; ...
      18 wn_data {idx1 ,1}. ACRE401 '; wn_data {idx1 ,1}. ACRE313 '; ...
      19 wn_data {idx1 ,1}. ACRE102 '; wn_data {idx1 ,1}. ACRE101 '];
      20
      21 % Get the time of each run
      22 t = wn_data {idx1 ,1}. time ;
      23 if rem ( length (t) ,2) ==0 % Remove last value if length is odd
      24 else
      25 t( end ) = [];
      26 A(:, end) = [];
      27 end
      28
      29 % Compute k
      30 L = t( end )+(t (2) -t (1) );
      31 n = length (t);
      32 k = (2* pi/L) *[0: n/2 -1 -n /2: -1];
      33 ks = fftshift (k);
      34
      35 % Gaussian filter
      36 filter = exp ( -0.008*( k) .^2) ;
      37 filter2 = 1- exp ( -1*(k) .^2) ;
      38
      39 % initiate average data variable
      40 Uave = zeros (1, length (A));
      41 for idx2 = 1: n2 % Loop through each sensor
      42 acc = A(idx2 ,:) ; % get accelerations
      43
      44 % Filter
      45 Utn = fft ( acc );
      46 Utn = filter .* Utn ; % Gaussian
      47 Utn = filter2 .* Utn ; % Inverse Gaussian
      48
      49 % Sum
      50 Uave = Uave + Utn ;
      51
      52 % Get max value of spectral content of each sensor
      53 [mxv1 , idxm1 ] = max (abs( Utn ));
      54 nrg (idx1 , idx2 ) = mxv1 ;
      55 w(idx1 , idx2 ) = k( idxm1 );
      27
      56 end
      57 % Get max value of spectral content of average
      58 [mxv1 , idxm1 ] = max (abs( Uave ));
      59 nrg_avg ( idx1 ) = mxv1 / idx2 ;
      60 w_avg ( idx1 ) = k( idxm1 );
      61 end
      62
      63 %% Plot natural frequencies and energy percentage
      64
      65 % Plot natural frequency of indivual test and sensors
      66 tst_no = [1 2 3 7 8 9 16 20 21]; % test number of interest
      67 figure (1)
      68 for idx_p = 1: length ( tst_no )
      69 y1 = 2* pi ./w( tst_no ( idx_p ) ,:); % each sensor
      70 y2 = 2* pi ./ mean (w( tst_no ( idx_p ) ,:)) *[1 1 1 1 1 1 1 1 1 1]; % average
      71 y3 = 2* pi ./ w_avg ( idx_p )*[1 1 1 1 1 1 1 1 1 1]; % average filter
      72
      73 subplot (3 ,3 , idx_p )
      74 plot (y1 ,'ko ', 'Linewidth ', [1.0]) ; hold on
      75 plot (y2 ,'blue '); hold on
      76 plot (y3 ,'red '); hold off
      77 title ([ 'Test number ' num2str ( tst_no ( idx_p ))])
      78 xlabel ('Sensor number ')
      79 ylabel ('Natural period (s)')
      80 ylim ([0.6 1.2])
      81 xlim ([1 10])
      82 grid on
      83 end
      84 legend ('Original ','Average of original ','Average filter ')
      85
      86 % Plot avg nat freq of each run
      87 figure (2)
      88 subplot (2 ,1 ,1)
      89 plot (2* pi ./ w_avg ,'o')
      90 xlabel ('Test number ')
      91 ylabel ('Natural period (s)')
      92 ylim ([0.6 1.2])
      93 xlim ([1 10])
      94 title ('Average filter method ')
      95 grid on
      96 hold on
Listing 2: Code to analyze the white noise test
 B.3 Spectrogram
      1 %% Final Project
      2 % Script for final project
      3
      4 %% Load data
      5 clc ; clear ; close all
      6
      7 load ('test_data . mat ')
      8
      9 g = 386.09; % Acceleration due to gravity ( inches per second per second )
      10 n1 = 14; % number of runs
      11 n2 = 10; % number of acceleromets
      12
      13 idx_test = 14; % the test number to run
      14 idx_sensor = 8; % the sensor data to use
      15
      16 tau = 1; % bandwidth of filter ( window size )
      17 N_steps = 301; % number of time steps taken
      18
      19 for idx1 = idx_test
      20 A = [ test_data {idx1 ,1}. AC1E402 '; test_data {idx1 ,1}. AC1E401 '; ...
      21 test_data {idx1 ,1}. AC1E301 '; test_data {idx1 ,1}. AC1E102 '; ...
      22 test_data {idx1 ,1}. AC1E101 '; test_data {idx1 ,1}. ACRE402 '; ...
      28
      23 test_data {idx1 ,1}. ACRE401 '; test_data {idx1 ,1}. ACRE313 '; ...
      24 test_data {idx1 ,1}. ACRE102 '; test_data {idx1 ,1}. ACRE101 '];
      25
      26 t = test_data {idx1 ,1}. time ;
      27 if rem ( length (t) ,2) ==0
      28 else
      29 t( end ) = [];
      30 A(:, end) = [];
      31 end
      32
      33 L = t( end )+(t (2) -t (1) );
      34 n = length (t);
      35 k = (2* pi/L) *[0: n/2 -1 -n /2: -1];
      36 ks = fftshift (k);
      37
      38 filter2 = 1- exp ( -1*(k) .^2) ;
      39
      40 for idx2 = idx_sensor
      41 acc = A(idx2 ,:) ; % get accelerations
      42 acc_t = fft (acc); % FFT
      43 acc_t = filter2 .* acc_t ; % Filter
      44 acc = ifft ( acc_t ); % iFFT
      45 v = acc ';
      46
      47 % Get spectrogram
      48 tslide = linspace (t (1) ,t( end ),N_steps ); % array of centered times of filter
      49 Sgt_spec =[]; % empty array of filtered signal frequency content
      50 % figure
      51 for j=1: length ( tslide )
      52 g= exp (- tau *(t- tslide (j)) .^2) ; % Gabor filter
      53 Sg=g.*v; % filter signal
      54 Sgt = fft (Sg); % transform filtered signal ( frequency content )
      55 Sgt_spec =[ Sgt_spec abs ( fftshift (Sgt))]; % add Sgt to array of Sgt
      56 % % Plot
      57 % plot (t,v,'k',t,g,'r ')
      58 % subplot (3 ,1 ,1) , plot (t,v,'k',t,g,'r ') % plot the signal and filter
      59 % axis ([0 37.5 -0.5 1])
      60 % subplot (3 ,1 ,2) , plot (t,Sg ,'k ') % plot the filtered signal
      61 % axis ([0 37.5 -0.5 0.5])
      62 % subplot (3 ,1 ,3) , plot (ks , abs ( fftshift ( Sgt )))
      63 % axis ([ ks (1) ks( end ) 0 ])
      64 % drawnow
      65 % pause (0.1)
      66 end
      67
      68 %% Plot spectrogram
      69
      70 % Plot spectrogram
      71 figure
      72 pcolor ( tslide ,ks , Sgt_spec ), shading interp
      73 set (gca ,'Ylim ' ,[0 ks( end )],'Fontsize ' ,[14])
      74 colormap ( hot )
      75 xlabel ('time (t)'); ylabel ('frequency (\ omega )')
      76
      77 % Plot zoomed in spectrogram
      78 figure
      79 pcolor ( tslide ,ks , Sgt_spec ), shading interp
      80 set (gca ,'Ylim ' ,[0 50] , 'Fontsize ' ,[14])
      81 colormap ( hot )
      82 xlabel ('time (t)'); ylabel ('frequency (\ omega )')
      83 end
      84 end
Listing 3: Code for generating the spectrogram
B.4 Interstory Response
      1 clc
      29
      2 clear all
      3 close all
      4 set (0, ' DefaultFigureWindowStyle ','docked ')
      5 % set (0,' DefaultFigureWindowStyle ',' default ')
      6 load ('test_data . mat ')
      7 MainU ={};
      8 for TN =6:14;
      9 time = test_data {TN ,1}. time ;
      10 Fs =1/( time (2) -time (1) );
      11 Test =" Test "+ string (TN);
      12 Measurements = test_data {TN ,:};
      13 opt_name ={ {'ACBE '}, {'ACBU '}, {'AC1E '}, {'AC1N '}, {'ACRE '}, {'ACRN '}};
      14 OrganizeTheData
      15 options ={ { ACBE }, { ACBU },{ AC1E }, { AC1N }, { ACRE }, { ACRN }};
      16 opt_labels ={{ ACBE_labels }, { ACBU_labels },{ AC1E_labels }, { AC1N_labels }, { ACRE_labels }, {
      ACRN_labels }};
      17
      18 for opt =1: size ( options ,2) ;
      19 AllDisp =[];
      20 for count =1: size ( opt_labels {opt }{1} ,1) ;
      21 figure ( opt +1)
      22 Acurr = options { opt }{1}(: , count );
      23 an = sum (Acurr ,2) ;
      24 f = fftshift (Fs *(0:( length ( time ) /2) ) /(2* pi* length ( time )));
      25 ant = abs ( fftshift ( fft (an)));
      26 filter = exp ( -8*(f) .^2) + ( -.18*(f-f (220) ) .^2) ;
      27 filter2 = (1- exp ( -15*( f) .^2) );%
      28 anft = filter .* ant ;
      29 anft = filter2 .* anft ;
      30 Acurr = ifft (( anft ));
      31 Data .( Test ).( opt_name {opt }{1}) .( cell2mat ( opt_labels { opt }{1}( count ,:) )). Acceleration =
      Acurr ;
      32 end
      33 Data .( opt_name { opt }{1}) . AllAccelerations .( Test )= options { opt };
      34 end
      35
      36
      37 figure
      38
      39 D1= Data . AC1E . AllAccelerations .( Test ) {1};
      40 DR= Data . ACRE . AllAccelerations .( Test ) {1};
      41 DB= Data . ACBE . AllAccelerations .( Test ) {1};
      42 Ds. ID_Bto1_E =( sum (D1 ,2) ./ size (D1 ,2) ) -( sum (DB ,2) ./ size (DB ,2) );
      43 Ds. ID_1toR_E =( sum (DR ,2) ./ size (DR ,2) ) -( sum (D1 ,2) ./ size (D1 ,2) );
      44
      45 subplot (2 ,1 ,1)
      46 hold on
      47 plot (time ,Ds. ID_Bto1_E ,'r')
      48 xlabel ('Time ( sec)')
      49 ylabel ('Accel (g)')
      50 title ('Base to Floor 1')
      51
      52 subplot (2 ,1 ,2)
      53 plot (time ,Ds. ID_1toR_E ,'r')
      54 hold on
      55 xlabel ('Time ( sec)')
      56 ylabel ('Accel (g)')
      57 title ('Floor 1 to Roof ')
      58 sgtitle (" Test No. "+ string (TN)+" Interstory Acceleration ")
      59 Resc =[DB ,Ds. ID_Bto1_E ,Ds. ID_1toR_E ];
      60 % Resc =[DB ,D1 ,DR ];
      61 [Uw ,Sw ,Vw ]= svd (Resc ,'econ ');
      62 figure (80)
      63 plot (Uw (: ,1:2) )
      64 figure (81)
      65 plot ( diag (Sw))
      66 Um=Uw*Sw;
      67
      30
      68 % for opt = size ( options ,2) ;
      69 A= cell2mat ( options { opt });
      70 Dcurr = Resc ;
      71 L= opt_labels {opt };
      72 %% SVD
      73
      74 [u, s, v] = DoSVDThings (Dcurr ,' Acceleration ',size (Dcurr ,2));
      75 figure ( opt )
      76 colorOrder = {'black ','blue ','red ','black ','blue ','red ','black ','blue ','red '};
      77 hold on
      78 RR =3;
      79 LastRec =0.* Dcurr (: ,1);
      80 for ii = 1: RR
      81 fig = figure (5* TN*opt +1) ;
      82 subplot (RR ,4 ,[(4* ii) -3 ,(4* ii) -2])
      83 hold on
      84 DcAv = detrend (sum (Dcurr ,2) ./ size (Dcurr ,2) );
      85 plot (time ,DcAv ,'Color ','red ','LineWidth ',TN /15) ;
      86 RN=Uw*Sw;
      87 Recon =RN (:, ii);
      88 [~, wUw ]= max ( abs ( Recon ));
      89 plot (time , detrend ( Recon ),'Color ','black ','LineWidth ',TN /20) ;
      90 legend (" Original Signal " ,...
      91 " SVD Mode "+ string (ii),'Location ','SouthEast ',' Orientation ','horizontal ')
      92 title (" Test No. "+ string (TN)+" {U} Mode "+ string (ii))
      93 grid on
      94 xlabel ('Time (sec)')
      95 ylabel ('Accel (g)')
      96 subplot (RR ,4 ,(4* ii) -1)
      97 D_inst = Dcurr (:, ii);
      98
      99 f = fftshift (Fs *(0:( length ( time ) /2) ) /(2* pi* length ( time )));
      100 X_mags = abs ( fftshift ( fft ( Recon )));
      101 X_mags = real ( X_mags ( end /2 : end ));
      102 plot ((f) ,( X_mags ),'Color ','black ','LineWidth ',TN /10) ;
      103 grid on
      104 hold on
      105 xlabel ('Frequency ({ hz }) ')
      106 ylabel ('dB ')
      107 title (" Test No. "+ string (TN)+" FFT ({U} Mode "+ string (ii) +") ")
      108 set (gca ,'XScale ','log ')
      109 [mx indx ]= max (( X_mags ));
      110 ModeFreq (TN ,ii)=f( indx );
      111 plot (f( indx ),mx ,'or ');
      112 plot ([f( indx ),f( indx ) *1/2] ,[ mx ,0.9* mx],'r');
      113 text (f( indx ) *1/80 , mx *0.9 ,"{\ omega }_n = "+ string (f( indx ))+" hz ");
      114 subplot (RR ,4 ,4* ii)
      115 hold on
      116 % Power Spectral Density
      117 power = X_mags .* conj ( X_mags )/ length (fft( X_mags ));
      118 % power = power ./ trapz (f, power );
      119
      120 plot (f,power ,'k'); hold on
      121
      122 plot (f( indx ),power ( indx ),'or ')
      123 plot ([f( indx ),f( indx ) *1/2] ,[ power ( indx ) ,0.9* power ( indx )],'r');
      124 text (f( indx ) *1/80 , power ( indx ) *0.9 ,"{\ omega }_n = "+ string (f( indx ))+" hz ");
      125 grid on
      126 set (gca ,'XScale ','log ')
      127 xlabel ('Frequency ({ hz }) ')
      128 ylabel ('PSD ({ dB/hz }) ')
      129 title (" PSD ({U} Mode "+ string (ii) +") Estimate ")
      130
      131 sgtitle (" Test No. "+ string (TN)+" Interstory Acceleration POD ")
      132 MainU (TN -5) ={ RN (: ,1) };
      133 WnTest (TN -5) =f( indx );
      134 end
      135
      31
      136 print (( Test ) +". jpg",'-djpeg ')
      137 % close all
      138
      139 end
 Listing 4: Interstory Acceleration Calculation and Analysis
      1 function [u,s,v]= DoSVDThings (X, DataName , time );
      2 DataRank = rank (X); % Computing rank
      3 [m,n]= size (X); % compute data size
      4 mn= mean (X ,1) ; % compute mean for each column
      5 X=X- repmat (mn ',1, size (X ,1) ) '; % subtract mean from X
      6 [u,s,v]= svd(X/ sqrt (n -1) ,'econ '); % perform the SVD
      7 figure (101)
      8 hold on
      9 rbrg ={{" k "};{" b "};{" r "};{" ok "};{" ob "};{" or "};{" xk "};{" xb "};{" xr "};{" k "};{" b "};{" r "};{" k "};{"
      b "};{" r "};{" k "};{" b "};{" r "}};
      10 plot (1: size (s ,1) ,diag (s).^.5 , rbrg { randi (9) }{1}) ;
      11
      12 xlabel ('Mode ')
      13 ylabel ('Energy ')
      14 title ('Power by Orthogonal Mode ')
      15 %% Lo - Rank
      16 nfeat = size (v ,1) ;
      17 fct = nfeat ;
      18
      19 for f=1: size (v ,2);
      20 [ val ind ] = sort (s(:,f),'descend ');
      21 mainfeat (f ,:)= ind (1: fct );
      22 end
      23 indd = mainfeat (1: fct ,:) ;
      24 upl =u(:, indd );
      25
      26 end
Listing 5: SVD Function
      1 FN= fieldnames ( Measurements );
      2 for FNC =1: size (FN);
      3 for abc =1: size ( opt_name ,2);
      4 Labels { FNC }= erase ( string (FN{ FNC }) ,string ( opt_name {abc }));
      5 end
      6 end
      7 ct =1: size (FN ,1);
      8 AC1N_names =FN(ct( startsWith (FN ,'AC1N ')));
      9 AC1N_labels =FN(ct( startsWith (FN ,'AC1N ')));
      10 AC1N =[];
      11 for i=1: size ( AC1N_names ,1)
      12 AC1N =[ AC1N , Measurements .( AC1N_names {i}) ];
      13 end
      14 AC1E_names =FN(ct( startsWith (FN ,'AC1E ')));
      15 AC1E_labels =FN(ct( startsWith (FN ,'AC1E ')));
      16 AC1E =[];
      17 for i=1: size ( AC1E_names ,1)
      18 AC1E =[ AC1E , Measurements .( AC1E_names {i}) ];
      19 end
      20 ACRN_names =FN(ct( startsWith (FN ,'ACRN ')));
      21 ACRN_labels =FN(ct( startsWith (FN ,'ACRN ')));
      22 ACRN =[];
      23 for i=1: size ( ACRN_names ,1)
      24 ACRN =[ ACRN , Measurements .( ACRN_names {i}) ];
      25 end
      26 ACRE_names =FN(ct( startsWith (FN ,'ACRE ')));
      27 ACRE_labels =FN(ct( startsWith (FN ,'ACRE ')));
      28 ACRE =[];
      29 for i=1: size ( ACRE_names ,1)
      30 ACRE =[ ACRE , Measurements .( ACRE_names {i}) ];
      31 end
      32
      32 ACBU_names =FN(ct( startsWith (FN ,'ACBU ')));
      33 ACBU_labels =FN(ct( startsWith (FN ,'ACBU ')));
      34 ACBU =[];
      35 for i=1: size ( ACBU_names ,1)
      36 ACBU =[ ACBU , Measurements .( ACBU_names {i}) ];
      37 end
      38 ACBE_names =FN(ct( startsWith (FN ,'ACBE ')));
      39 ACBE_labels =FN(ct( startsWith (FN ,'ACBE ')));
      40 ACBE =[];
      41 for i=1: size ( ACBE_names ,1)
      42 ACBE =[ ACBE , Measurements .( ACBE_names {i}) ];
      43 end
      Listing 6: Data Organzation Function
