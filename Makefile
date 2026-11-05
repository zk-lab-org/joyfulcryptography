SLIDES := $(wildcard slides/*.tex)
TARGETS_SLIDES = $(SLIDES:slides/%.tex=objects/slides/%.pdf)
TARGETS_LAB = lab-password-manager lab-secure-messenger lab-zk-battleship lab-proverif-model lab-pq-migration lab-contact-discovery lab-private-auth lab-time-lock
TARGETS_PROBLEM_SET = problem-set-1 problem-set-2 problem-set-3 problem-set-4 problem-set-5 problem-set-6 problem-set-7 problem-set-8
TARGETS_QUIZ = quiz-1-2 quiz-1-3 quiz-1-4 quiz-1-5 quiz-1-6 quiz-1-7 quiz-1-8 quiz-2-1 quiz-2-2 quiz-2-3 quiz-2-4 quiz-2-5 quiz-2-6 quiz-2-7 quiz-2-8
TARGETS_SYLLABUS = syllabus

all: slides #lab problem-set quiz syllabus
slides: $(TARGETS_SLIDES)
lab: $(TARGETS_LAB)
problem-set: $(TARGETS_PROBLEM_SET)
quiz: $(TARGETS_QUIZ)
clean:
	@$(RM) -r objects/slides/*.pdf objects/lab/*.pdf objects/problem-set/*.pdf objects/syllabus/*.pdf objects/quiz/*.pdf starter-kit/target

$(TARGETS_SLIDES): $(SLIDES)

objects/slides/%.pdf: slides/%.tex
	@tectonic -o objects/slides $<

$(TARGETS_LAB):
	@tectonic -o objects/lab "lab/$@.tex"

$(TARGETS_PROBLEM_SET):
	@tectonic -o objects/problem-set "problem-set/$@.tex"

$(TARGETS_QUIZ):
	@tectonic -o objects/quiz "quiz/$@.tex"

$(TARGETS_SYLLABUS):
	@tectonic -o objects/syllabus "syllabus/$@.tex"

.PHONY: all slides lab problem-set quiz clean $(TARGETS_LAB) $(TARGETS_PROBLEM_SET) $(TARGETS_QUIZ) $(TARGETS_SYLLABUS)
