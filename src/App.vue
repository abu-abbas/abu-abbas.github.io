<template>
  <div id="app" v-cloak>
    <div
      id="app-content"
      :class="isDark ? 'bg-[#131314] text-slate-400' : 'bg-white text-slate-600'"
      class="min-h-screen relative selection:bg-zinc-200"
    >
      <div class="fixed top-8 right-8 no-print z-50 flex flex-col gap-3">
        <button
          @click="toggleDarkMode"
          title="Ganti Tema"
          class="flex h-10 w-10 items-center justify-center rounded-full border shadow-lg transition-all active:scale-90"
          :class="
            isDark
              ? 'bg-zinc-800 border-zinc-700 text-zinc-300 hover:bg-zinc-700'
              : 'bg-white border-zinc-200 text-zinc-800 hover:bg-zinc-50'
          "
        >
          <svg
            v-if="isDark"
            xmlns="http://www.w3.org/2000/svg"
            class="h-5 w-5"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364-6.364l-.707.707M6.343 17.657l-.707.707m12.728 0l-.707-.707M6.343 6.364l-.707.707M15 12a3 3 0 11-6 0 3 3 0 016 0z"
            />
          </svg>
          <svg
            v-else
            xmlns="http://www.w3.org/2000/svg"
            class="h-5 w-5"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"
            />
          </svg>
        </button>

        <button
          @click="printCV"
          title="Cetak Manual"
          class="flex h-10 w-10 items-center justify-center rounded-full border shadow-lg transition-all active:scale-90"
          :class="
            isDark
              ? 'bg-zinc-800 border-zinc-700 text-zinc-300 hover:bg-zinc-700'
              : 'bg-white border-zinc-200 text-zinc-800 hover:bg-zinc-50'
          "
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="h-5 w-5"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z"
            />
          </svg>
        </button>

        <button
          @click="downloadPDF"
          title="Unduh PDF Langsung"
          class="flex h-10 w-10 items-center justify-center rounded-full border shadow-lg transition-all active:scale-90"
          :class="
            isDark
              ? 'bg-zinc-800 border-zinc-700 text-zinc-300 hover:bg-zinc-700'
              : 'bg-white border-zinc-200 text-zinc-800 hover:bg-zinc-50'
          "
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="h-5 w-5"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"
            />
          </svg>
        </button>
      </div>

      <div id="cv-capture-area" class="max-w-5xl mx-auto px-6 py-10 md:px-12 lg:px-20">
        <div id="pdf-root">
          <div class="grid grid-cols-1 md:grid-cols-12 gap-10 lg:gap-14">
            <div class="md:col-span-8">
              <header class="mb-10">
                <h1
                  class="text-[58px] font-bold name-heading mb-4 transition-colors"
                  :class="isDark ? 'text-white' : 'text-[#1e1f20]'"
                >
                  {{ cv.name }}
                </h1>
                <p
                  class="text-[14.5px] leading-relaxed font-medium transition-colors opacity-85"
                  :class="isDark ? 'text-slate-400' : 'text-slate-600'"
                >
                  {{ cv.tagline }}
                </p>
              </header>

              <section>
                <h2
                  class="text-[13.5px] font-bold mb-6 transition-colors tracking-tight"
                  :class="isDark ? 'text-white' : 'text-[#1e1f20]'"
                >
                  Relevant Experience
                </h2>

                <div class="space-y-8">
                  <div v-for="(exp, index) in cv.experiences" :key="index">
                    <div class="space-y-0.5 mb-2.5">
                      <div
                        v-for="(role, rIndex) in exp.roles"
                        :key="rIndex"
                        class="flex items-baseline flex-wrap gap-x-2"
                      >
                        <h3 class="text-content">
                          <span
                            class="font-normal"
                            :class="isDark ? 'text-slate-300' : 'text-slate-600'"
                            >{{ role.title }}</span
                          >
                          <template v-if="rIndex === 0">
                            <span class="text-slate-300 mx-1 font-normal opacity-40">·</span>
                            <span
                              class="font-bold whitespace-nowrap"
                              :class="isDark ? 'text-white' : 'text-[#1e1f20]'"
                              >{{ exp.company }}</span
                            >
                          </template>
                        </h3>
                        <span
                          class="text-[10.5px] font-medium whitespace-nowrap opacity-50"
                          :class="isDark ? 'text-slate-500' : 'text-slate-400'"
                        >
                          {{ role.period }}
                        </span>
                      </div>
                    </div>

                    <ul class="space-y-2">
                      <li
                        v-for="(bullet, bIndex) in exp.bullets"
                        :key="bIndex"
                        class="flex items-start text-bullet"
                        :class="isDark ? 'text-slate-400' : 'text-slate-500'"
                      >
                        <span
                          class="mr-3 mt-[0.55rem] shrink-0 w-[4.5px] h-[4.5px] rounded-full"
                          :class="isDark ? 'bg-slate-400' : 'bg-[#1e1f20]'"
                        ></span>
                        <span>{{ bullet }}</span>
                      </li>
                    </ul>
                  </div>
                </div>
              </section>
            </div>

            <div class="md:col-span-4 space-y-8 mt-1">
              <div
                class="text-sidebar space-y-0.5 font-medium tracking-tight text-left mb-8 transition-colors"
                :class="isDark ? 'text-slate-500' : 'text-slate-400'"
              >
                <p class="hover:text-blue-500 transition-colors cursor-pointer">
                  {{ cv.contact.email }}
                </p>
                <p>{{ cv.contact.phone }}</p>
                <p class="hover:text-blue-500 transition-colors cursor-pointer">
                  {{ cv.contact.github }}
                </p>
                <p class="hover:text-blue-500 transition-colors cursor-pointer">
                  {{ cv.contact.website }}
                </p>
              </div>

              <section>
                <h2
                  class="text-[12px] font-bold mb-4 tracking-tight transition-colors"
                  :class="isDark ? 'text-white' : 'text-[#1e1f20]'"
                >
                  Skills
                </h2>
                <div class="space-y-6">
                  <div v-for="item in cv.skillGroups" :key="item.title" class="text-sidebar">
                    <h3
                      class="font-bold mb-1"
                      :class="isDark ? 'text-slate-200' : 'text-[#1e1f20]'"
                    >
                      {{ item.title }}
                    </h3>
                    <p
                      class="font-medium leading-relaxed opacity-85"
                      :class="isDark ? 'text-slate-400' : 'text-slate-500'"
                    >
                      {{ item.content }}
                    </p>
                  </div>
                </div>
              </section>

              <section>
                <h2
                  class="text-[12px] font-bold mb-4 tracking-tight transition-colors"
                  :class="isDark ? 'text-white' : 'text-[#1e1f20]'"
                >
                  Selected Projects
                </h2>
                <div class="space-y-6">
                  <div
                    v-for="project in cv.selectedProjects"
                    :key="project.title"
                    class="text-sidebar"
                  >
                    <h3
                      class="font-bold mb-1"
                      :class="isDark ? 'text-slate-200' : 'text-[#1e1f20]'"
                    >
                      {{ project.title }}
                    </h3>
                    <p
                      class="font-medium leading-relaxed opacity-85"
                      :class="isDark ? 'text-slate-400' : 'text-slate-500'"
                    >
                      {{ project.description }}
                    </p>
                  </div>
                </div>
              </section>

              <section>
                <h2
                  class="text-[12px] font-bold mb-4 tracking-tight transition-colors"
                  :class="isDark ? 'text-white' : 'text-[#1e1f20]'"
                >
                  Education
                </h2>
                <div class="text-sidebar">
                  <h3 class="font-bold" :class="isDark ? 'text-slate-200' : 'text-[#1e1f20]'">
                    Universitas Budi Luhur Jakarta
                  </h3>
                  <div class="opacity-85 font-medium">
                    <p>Bachelor of Computer Science</p>
                    <p class="text-[9px] uppercase tracking-widest font-bold mt-0.5">
                      Information Technology
                    </p>
                  </div>
                </div>
              </section>

              <section id="interests-section">
                <h2
                  class="text-[12px] font-bold mb-4 tracking-tight transition-colors"
                  :class="isDark ? 'text-white' : 'text-[#1e1f20]'"
                >
                  Interests
                </h2>
                <p
                  id="interests-text"
                  class="text-sidebar font-medium leading-relaxed opacity-85"
                  :class="isDark ? 'text-slate-400' : 'text-slate-500'"
                >
                  {{ interestsText }}
                </p>
              </section>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue';
import { jsPDF } from 'jspdf';
import { cvData } from './data/cvData';

const isDark = ref(false);

const cv = cvData;
const interestsText = cv.interests.join(', ');

const toggleDarkMode = () => {
  isDark.value = !isDark.value;
  localStorage.setItem('cv-theme-wibowo', isDark.value ? 'dark' : 'light');
};

const printCV = () => {
  const wasDark = isDark.value;
  isDark.value = false;

  // Give Vue a moment to flush DOM updates before opening print dialog.
  setTimeout(() => {
    window.print();

    // Restore previous theme after print dialog closes.
    setTimeout(() => {
      isDark.value = wasDark;
    }, 300);
  }, 100);
};

const downloadPDF = async () => {
  await document.fonts.ready;

  const wasDark = isDark.value;
  isDark.value = false;

  const element = document.getElementById('pdf-root');
  if (!element) return;

  await new Promise((r) => setTimeout(r, 350));

  try {
    const A4_W = 794;
    const exportHeight = Math.ceil(element.scrollHeight);
    const exportHeightWithBuffer = exportHeight + 320;

    const worker = window
      .html2pdf?.()
      .set({
        html2canvas: {
          scale: 1.8,
          useCORS: true,
          backgroundColor: '#ffffff',
          scrollX: 0,
          scrollY: 0,
          x: 0,
          y: 0,
          windowWidth: A4_W,
          windowHeight: exportHeightWithBuffer,
          width: A4_W,
          height: exportHeightWithBuffer,
          onclone: (clonedDoc: Document) => {
            clonedDoc.documentElement.style.width = `${A4_W}px`;
            clonedDoc.body.style.width = `${A4_W}px`;
            clonedDoc.body.style.margin = '0';
            clonedDoc.documentElement.style.overflow = 'visible';
            clonedDoc.body.style.overflow = 'visible';
            clonedDoc.body.style.minHeight = `${exportHeightWithBuffer}px`;

            const style = clonedDoc.createElement('style');
            style.textContent = `
              #cv-capture-area{
                width:${A4_W}px !important;
                max-width:${A4_W}px !important;
                margin:0 auto !important;
                padding:0 !important;
                overflow:visible !important;
              }
              #pdf-root{
                width:${A4_W}px !important;
                max-width:${A4_W}px !important;
                margin:0 !important;
                padding:36px 46px 28px 46px !important;
                box-sizing:border-box !important;
                overflow:visible !important;
                min-height:${exportHeightWithBuffer}px !important;
              }
              #interests-text{
                display:block !important;
                opacity:1 !important;
                color:#2b2b2b !important;
                font-size:9.5px !important;
                line-height:1.15 !important;
                white-space:normal !important;
                overflow:visible !important;
                margin-top:2px !important;
                margin-bottom:0 !important;
              }
              #interests-section h2{
                margin-bottom:4px !important;
                text-transform:none !important;
                letter-spacing:normal !important;
              }
            `;
            clonedDoc.head.appendChild(style);

            const interestsNode = clonedDoc.getElementById('interests-text');
            const interestsTitle = clonedDoc.querySelector(
              '#interests-section h2',
            ) as HTMLElement | null;
            const interestsSection = clonedDoc.getElementById('interests-section');
            if (interestsNode) {
              interestsNode.textContent = interestsText;
              interestsNode.setAttribute('style', 'display:none !important;');
            }
            if (interestsTitle) {
              interestsTitle.textContent = `Interests: ${interestsText}`;
              interestsTitle.setAttribute(
                'style',
                'font-size:10px;font-weight:600;line-height:1.2;margin-bottom:0 !important;color:#2b2b2b !important;',
              );
            }
            if (interestsSection) {
              interestsSection.setAttribute('style', 'margin-top:0.35rem !important;');
            }

            const capture = clonedDoc.getElementById('cv-capture-area');
            const pdfRoot = clonedDoc.getElementById('pdf-root');
            if (capture) capture.classList.add('pdf-export-container', 'no-tailwind-padding');
            if (pdfRoot) pdfRoot.classList.add('pdf-export-inner');
          },
        },
      })
      .from(element)
      .toCanvas();

    if (!worker)
      throw new Error('html2pdf is not available. Ensure html2pdf.bundle.min.js is loaded.');

    const canvas = await worker.get('canvas');
    if (!canvas) throw new Error('Canvas is not available from html2pdf worker');

    const imgData = canvas.toDataURL('image/jpeg', 0.72);

    const pdf = new jsPDF({
      unit: 'mm',
      format: 'a4',
      orientation: 'portrait',
      compress: true,
    });

    const pageW = 210;
    const pageH = 297;
    const margin = 4;
    const maxW = pageW - margin * 2;
    const maxH = pageH - margin * 2;

    const pxToMm = 0.264583;
    const imgWmm = canvas.width * pxToMm;
    const imgHmm = canvas.height * pxToMm;
    const ratio = Math.min(maxW / imgWmm, maxH / imgHmm);

    const drawW = imgWmm * ratio;
    const drawH = imgHmm * ratio;
    const x = (pageW - drawW) / 2;
    const y = margin;

    pdf.addImage(imgData, 'JPEG', x, y, drawW, drawH, undefined, 'MEDIUM');
    pdf.save('CV_Wibowo_Sulistiyo.pdf');
  } catch (err) {
    console.error('PDF Export failed:', err);
    alert('PDF Export gagal. Buka Console untuk detail error.');
  } finally {
    isDark.value = wasDark;
  }
};

const syncTheme = () => {
  const savedTheme = localStorage.getItem('cv-theme-wibowo');
  if (savedTheme) {
    isDark.value = savedTheme === 'dark';
  } else {
    isDark.value = window.matchMedia('(prefers-color-scheme: dark)').matches;
  }
};

const runtimeChecks = () => {
  const ok: string[] = [];
  const bad: string[] = [];
  ok.push('Vue');
  if (typeof window.html2pdf === 'function') ok.push('html2pdf');
  else bad.push('html2pdf');
  if (typeof jsPDF === 'function') ok.push('jsPDF');
  else bad.push('jsPDF');
  if (bad.length) console.warn('[CV] Missing libs:', bad.join(', '));
  if (ok.length) console.info('[CV] Loaded:', ok.join(', '));
};

onMounted(() => {
  runtimeChecks();
  syncTheme();
  window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
    if (!localStorage.getItem('cv-theme-wibowo')) {
      isDark.value = e.matches;
    }
  });
});
</script>
